require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should not save article without title" do
    article = Article.new
    assert article.save, "Saved the article without a title"
  end

end
