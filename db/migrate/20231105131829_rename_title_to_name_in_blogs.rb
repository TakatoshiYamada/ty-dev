class RenameTitleToNameInBlogs < ActiveRecord::Migration[7.0]
  def change
    rename_column :blogs, :title, :name
  end
end
