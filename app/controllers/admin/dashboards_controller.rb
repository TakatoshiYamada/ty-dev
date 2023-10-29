class Admin::DashboardsController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'

  def index
    @blogs = current_user.blogs.order(created_at: :desc)
  end
end
