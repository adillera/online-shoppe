class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :product, index: true

      t.timestamps null: false
    end

    add_foreign_key :images, :products, on_delete: :cascade
  end
end
