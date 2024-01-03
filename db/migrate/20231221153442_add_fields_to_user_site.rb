class AddFieldsToUserSite < ActiveRecord::Migration[7.0]
  def change
    add_column :user_sites, :name, :string
    add_column :user_sites, :description, :text
  end
end
