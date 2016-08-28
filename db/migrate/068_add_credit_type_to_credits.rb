class AddCreditTypeToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :credit_type, :integer
  end
end
