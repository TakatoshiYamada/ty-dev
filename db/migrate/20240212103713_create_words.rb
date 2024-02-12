class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.text :content
      t.string :speaker
      t.text :source
      t.text :memo
      t.datetime :date

      t.timestamps
    end
  end
end
