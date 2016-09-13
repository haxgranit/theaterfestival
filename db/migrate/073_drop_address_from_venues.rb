class DropAddressFromVenues < ActiveRecord::Migration
  def change
    remove_column :venues, :address1
    remove_column :venues, :address2
  end
end
