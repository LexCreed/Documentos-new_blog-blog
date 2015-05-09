class ArticlesController < ApplicationController
	
	#GET /articles
	def index
		@articles = Article.all 
	end	
	
	#Get/articles/:id
	def show 
  		@article = Article.find(params[:id])    		
	end 

	#Get /articles/new
	def new
		@article = Article.new	
	end

	def edit
		@article =Article.find(params[:id])
		
	end

	#Post/articles
	def create
		@article = Article.new(article_params)
		
		if @article.save
			redirect_to @article
		else
			render :new	
		end
	end

	def destroy
		@article =Article.find(params[:id])
		@article.destroy
		redirect_to articles_path  
	end

	#Put/articles/:id
	def update 
		@article = Article.find(params[:id]) 
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end	
	end

	private 

	def article_params
		params.require(:article).permit(:titulo, :cuerpo)
	end
end