class AddDateMaskToProductions < ActiveRecord::Migration
  def change
    add_column :productions, :date_mask, :int
  end
end
