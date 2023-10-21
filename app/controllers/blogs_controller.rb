class BlogsController < ApplicationController

  def index
    @blogs = current_user.blogs.order(created_at: :desc)
  end


  def show
  end
end
