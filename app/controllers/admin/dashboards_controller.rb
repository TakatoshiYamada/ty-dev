class Admin::DashboardsController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'

  def index
  end

  def show
  end
end
