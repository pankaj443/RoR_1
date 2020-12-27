class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:edit,:update,:show,:destroy]
    
    
    def index
        
        @articles = Article.all
        
    end
    
    
    def destroy
        
        
        @article.destroy
        
        flash[:danger] = "DELETED"
        redirect_to articles_path
        
        
    end
    
    
    def new
        @article = Article.new
    end
    
    
    def edit
        
        
        
    end
    
    
    
    def update
        
        
        
        if @article.update(article_params)
            
            flash[:success] = "UPDATED"
            redirect_to article_path(@article)
            
        else
            
            render 'edit'
            
        end
        
    end
    
    def create
        #render plain:params[:article].inspect
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
            
            flash[:success] = "SAVED"
            redirect_to article_path(@article)
            
        else
            
            render 'new'
            
        end
            
    
       
    end
    
    
    def show
        
        
    end
    
    private
    
    
        def set_article
            
            @article = Article.find(params[:id])
        end
        def article_params
            params.require(:article).permit(:title,:description)
        end
    
end