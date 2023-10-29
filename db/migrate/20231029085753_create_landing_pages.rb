class CreateLandingPages < ActiveRecord::Migration[7.0]
  def change
    create_table :landing_pages do |t|
      t.string :title
      t.text :body
      t.string :image

      t.timestamps
    end
  end
end
