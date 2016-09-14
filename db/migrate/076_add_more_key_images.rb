class AddMoreKeyImages < ActiveRecord::Migration
  def change
    add_column :festivals, :festival_image_id, :string
    add_column :venues, :venue_image_id, :string
  end
end
