class RemoveTypeFromProductionCredits < ActiveRecord::Migration
  def change
    remove_column :production_credits, :type
  end
end
