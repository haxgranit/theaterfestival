class MissedOne < ActiveRecord::Migration
  def change
    remove_reference :companies, :company_social_metadata
    add_reference :company_social_metadata, :company, index: {:unique=>true}, foreign_key: true
  end
end
