class AddIndexToProductionShowtimeLinks < ActiveRecord::Migration
  def change
    remove_index :production_showtime_links, :showtime_id
    add_index :production_showtime_links, :showtime_id, unique: true
  end
end
