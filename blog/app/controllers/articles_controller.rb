class ArticlesController < ApplicationController
 before_action :authenticate_user!, except: [:show, :index]
 before_action :set_article, except: [:index, :new, :create];

#GET /articles
  def index
    #Obtiene todo los registros de la tabla Articles la base de datos
  	@articles = Article.all
  end
#GET /articles/:id
  def show
    #Obtiene el dato Article por Id de la base de datos
  	#@article = Article.find(params[:id])
    #Para buscar por otro parametro, Article.find_by(title: "El Titulo") -> solo retorna un elemento
    #Para buscar muchos, Article.where("title LIKE ?", "%Titulo%") -> retorna un array
    #Para usar not in, Article.where.not("id = 1") -> retorna un array

    @article.update_visits_count
    @comment = Comment.new
  end

 #GET /articles/new
  def new
    @article = Article.new
  end

 #POST /articles
  def create
  	#@article = Article.new(title: params[:article][:title],
  	#	body: params[:article][:body])
    @article = current_user.articles.new(article_params)

  	if @article.save
    	redirect_to @article
    else
      render :new
    end
  end

#PUT /articles/:id
  def update
    #@article.update_attributes({title: 'Nuevo Titulo'})
    #@article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end 

  def edit
    #@article = Article.find(params[:id])
  end

#DELETE /articles/:id
  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end

  
end