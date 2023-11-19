class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
    @blog = @article.blog
  end

end
