class CreateKitRelationships < ActiveRecord::Migration
  def change
    create_table :kit_relationships do |t|
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
  end
end
