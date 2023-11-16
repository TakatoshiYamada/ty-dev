class BlogsController < ApplicationController
  # Devise のログインチェックをスキップ
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end
end
