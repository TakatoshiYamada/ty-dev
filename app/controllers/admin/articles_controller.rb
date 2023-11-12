class Admin::ArticlesController < AdminController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_blog
  before_action :set_article, only: [:edit, :update]

  def index
    binding.break
    @blogs = Blog.all
  end

  def new
    @article = @blog.articles.new
  end

  def create
  end

  def edit
    # 編集用のアクション
  end

  def update
    if @article.update(article_params)
      redirect_to admin_blog_article_path(@blog, @article), notice: 'Article was successfully updated.'
    else
      render :edit
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
    params.require(:article).permit(:title, :content, :その他の属性...)
  end
end
