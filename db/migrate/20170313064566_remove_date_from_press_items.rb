class RemoveDateFromPressItems < ActiveRecord::Migration
  def change
    remove_column :press_items, :date
  end
end
