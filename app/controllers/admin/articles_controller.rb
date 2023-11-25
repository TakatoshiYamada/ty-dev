class Admin::ArticlesController < AdminController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_blog
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = @blog.articles
  end

  def show
  end

  def new
    @article = @blog.articles.new
  end

  def create
     @article = @blog.articles.create(article_params)
    if @article.save
      redirect_to admin_blog_articles_path(@blog), notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def edit
    if @article.nil?
      redirect_to admin_blog_articles_path(@blog), alert: 'Article not found.'
    else
      render :edit
    end
  end

  def update
    if @article.update(article_params)
      redirect_to admin_blog_article_path(@blog, @article), notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @article.destroy
      redirect_to admin_blog_articles_path(@blog), notice: 'Article was successfully deleted.'
    else
      redirect_to admin_blog_articles_path(@blog), alert: 'Article was not deleted.'
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

  def set_article
    @article = @blog.articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :thumbnail, images: [])
  end
end
