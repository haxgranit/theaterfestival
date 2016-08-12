class AddGeoInfoToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :address, :text
    add_column :venues, :city, :string
    add_column :venues, :state, :string
    add_column :venues, :zip, :string
    add_column :venues, :lat, :float
    add_column :venues, :lng, :float
  end
end
