class AddCompanyImageToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :company_image_id, :string
  end
end
