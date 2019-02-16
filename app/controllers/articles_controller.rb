class ArticlesController < ApplicationController
#http_basic_authenticate_with name: "orko", password: "1234567",
#except: [:index, :show, :search]

before_action :admin_authorize, :except: [:index, :show, :search]

  def index
    @articles = Article.all
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
    redirect_to article_path
  end

private
  def article_params
    params.require(:article).permit(:title, :text, :search)
  end
  end
