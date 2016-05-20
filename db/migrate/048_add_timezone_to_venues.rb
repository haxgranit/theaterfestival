class AddTimezoneToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :time_zone, :text
  end
end
