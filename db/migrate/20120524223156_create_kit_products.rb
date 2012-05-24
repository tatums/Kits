class CreateKitProducts < ActiveRecord::Migration
  def change
    create_table :kit_products do |t|
      t.integer :kit_id
      t.integer :product_id

      t.timestamps
    end
  end
end
