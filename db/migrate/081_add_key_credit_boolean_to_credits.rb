class AddKeyCreditBooleanToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :key_credit, :boolean
  end
end
