class SetDefaultDateOnPressItems < ActiveRecord::Migration
  def change
    change_column :press_items, :date, :date, default: Date.today
  end
end
