class DropCreditedAsFromCredits < ActiveRecord::Migration
  def change
    remove_column :credits, :credited_as
  end
end
