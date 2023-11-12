class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  private

  def check_admin
    binding.break
    redirect_to(root_url) unless current_user.admin?
  end
end
