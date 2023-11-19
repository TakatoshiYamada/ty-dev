class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  # 逆にするとエラーになる
  before_action :set_blog, only: [:show]

  def show
  end

  private

  def set_blog
    @blog = @article.blog
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
