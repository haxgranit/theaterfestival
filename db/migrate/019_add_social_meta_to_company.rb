class AddSocialMetaToCompany < ActiveRecord::Migration
  def change
    add_reference :companies, :company_social_metadata, index: true, foreign_key: true
  end
end
