class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.integer :thumbnail_id
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
