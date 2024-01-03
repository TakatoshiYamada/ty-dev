class Admin::UserSitesController < AdminController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_user_site, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
    if @user_site.nil?
      redirect_to admin_user_sites_path, alert: 'UserSite not found.'
    else
      render :edit
    end
  end

  def update
    if @user_site.update(user_site_params)
      redirect_to admin_user_site_path(@user_site), notice: 'UserSite was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user_site
    @user_site = current_user.user_site
  end

  def user_site_params
    params.require(:user_site).permit(:name, :description, :hero_image)
  end

end
