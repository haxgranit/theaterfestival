class AddPersonalInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :text
    add_column :users, :last_name, :text
    add_column :users, :time_zone, :text
    add_column :users, :location, :text
  end
end
