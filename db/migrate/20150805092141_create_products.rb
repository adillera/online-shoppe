class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price, default: 0
      t.integer :thumbnail_id
      t.boolean :is_active, default: true

      t.timestamps null: false
    end
  end
end
