class ArticlesController < ApplicationController
#http_basic_authenticate_with name: "orko", password: "1234567",
#except: [:index, :show, :search]

before_action :edit, :admin_authorize, :except => [:index, :show, :search]

  def index
    if params[:category].blank?
      @articles = Article.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @articles = Article.where(category_id: @category_id).order("created_at DESC")
    end
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def search
    if params[:search].blank?
      @articles = Article.all
    else
      @articles = Article.search(params)
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

private
  def article_params
    params.require(:article).permit(:title, :text, :search, :music, :movie, :photo)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
