class RemoveTimeZoneFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :time_zone, :string
  end
end
