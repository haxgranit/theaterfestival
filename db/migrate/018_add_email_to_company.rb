class AddEmailToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :email, :text
  end
end
