class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroys]
    def index
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end
    
    def edit
    end
    
    def create
        @article = Article.new(article_param)
        if @article.save
            flash[:notice] = "Articel was succefully created"
            redirect_to article_path(@article) 
        else
            render 'new'
        end
    end
    
    def show 
    end

    def update
        
        if @article.update(article_param)
            flash[:notice] = "Articel was succefully updated"
            redirect_to article_path(@article) 
        else
            render 'edit'
        end
    end
    
    def destroy
        @article.destroy
        flash[:notice] = "Articel was succefully deleted"
        redirect_to articles_path(@article) 
    end
    
    private
    def set_article
        @article = Article.find(params[:id])
    end
    
    def article_param
        params.require(:article).permit(:title, :description)
    end

end
