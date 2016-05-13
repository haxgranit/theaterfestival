class AddIndexToCompany < ActiveRecord::Migration
  def change
    remove_index :companies, :company_social_metadata_id
    add_index :companies, :company_social_metadata_id, unique: true
  end
end
