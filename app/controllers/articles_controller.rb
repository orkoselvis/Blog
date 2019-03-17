class ArticlesController < ApplicationController
before_action :admin_authorize, :except => [:index, :show, :search]

  def index
    @articles = Article.includes(:category).order("created_at DESC")
    if params[:category].blank?
      @articles = Article.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @articles = Article.where(category_id: @category_id).order("created_at DESC")
    end
  end

  def new
    @article = Article.new
    @categories = Category.all.map{|c| [c.name, c.id]}
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.category_id = params[:category_id]

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article was successfully created!" }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new}
        format.json {render json: @article.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
    @article = Article.find(params[:id])
    @categories = Category.all.map{|c| [ c.name, c.id ] }
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
    @article.category_id = params[:category_id]
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
