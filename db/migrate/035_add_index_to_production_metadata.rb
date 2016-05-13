class AddIndexToProductionMetadata < ActiveRecord::Migration
  def change
    remove_index :production_metadata, :production_id
    add_index :production_metadata, :production_id, unique: true
  end
end
