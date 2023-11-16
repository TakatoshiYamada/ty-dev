class RenameContentToDescriptionInBlogs < ActiveRecord::Migration[7.0]
  def change
    rename_column :blogs, :content, :description
  end
end
