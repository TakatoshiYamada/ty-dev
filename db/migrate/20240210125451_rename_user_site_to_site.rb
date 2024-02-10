class RenameUserSiteToSite < ActiveRecord::Migration[7.0]
  def change
    rename_table :user_sites, :sites
  end
end
