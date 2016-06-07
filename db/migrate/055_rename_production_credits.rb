class RenameProductionCredits < ActiveRecord::Migration
  def change
    rename_table :production_credits, :credits
  end
end
