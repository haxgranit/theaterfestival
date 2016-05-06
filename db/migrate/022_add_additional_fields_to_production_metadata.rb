class AddAdditionalFieldsToProductionMetadata < ActiveRecord::Migration
  def change
    add_column :production_metadata, :recommended_age, :text
    add_column :production_metadata, :website, :text
  end
end
