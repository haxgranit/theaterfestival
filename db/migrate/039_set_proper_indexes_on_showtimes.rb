class SetProperIndexesOnShowtimes < ActiveRecord::Migration
  def change
    remove_index :showtimes, :showtime_ticket_metadata_id
    remove_index :showtimes, :showtime_accessibility_metadata_id
    add_index :showtimes, :showtime_ticket_metadata_id, unique: true
    add_index :showtimes, :showtime_accessibility_metadata_id, unique: true
  end
end
