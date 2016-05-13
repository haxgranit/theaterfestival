class AddIndexToCompanyMetadata < ActiveRecord::Migration
  def change
    remove_index :company_metadata, :company_id
    add_index :company_metadata, :company_id, unique: true
  end
end
