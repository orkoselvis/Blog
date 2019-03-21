module Categories
  class ArticlesController
    before_action :set_category

    # GET /categories/:category_id/articles
    def index
      @articles = @category.articles.order(created_at: :desc)
    end

    def set_category
      @category = Category.includes(:articles).find(params[:category_id])
    end
  end
end
