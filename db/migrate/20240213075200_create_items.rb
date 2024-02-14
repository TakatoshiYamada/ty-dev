class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.text :content
      t.text :source
      t.text :memo
      t.datetime :date

      t.timestamps
    end
  end
end
