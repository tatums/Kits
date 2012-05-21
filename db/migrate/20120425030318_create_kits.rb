class CreateKits < ActiveRecord::Migration
  def change
    create_table :kits do |t|
      t.string :title
      t.integer :kit_id

      t.timestamps
    end
  end
end
