class AddTypeDiscriminantToProductionCredits < ActiveRecord::Migration
  def change
    add_column :production_credits, :type, :string
  end
end
