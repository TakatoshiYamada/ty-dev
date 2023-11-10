# app/controllers/admin/blogs_controller.rb
class Admin::BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user
    if @blog.save
      redirect_to [:admin, @blog], notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to [:admin, @blog], notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to admin_blogs_url, status: :see_other, notice: 'Blog was successfully destroyed.' }
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:name, :description)
  end

  def check_admin
    redirect_to(root_url) unless current_user.admin?
  end
end
