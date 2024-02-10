class Admin::SitesController < AdminController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
    if @site.nil?
      redirect_to admin_sites_path, alert: 'Site not found.'
    else
      render :edit
    end
  end

  def update
    if @site.update(site_params)
      redirect_to admin_site_path(@site), notice: 'Site was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_site
    @site = current_user.site
  end

  def site_params
    params.require(:site).permit(:name, :description, :hero_image)
  end

end
