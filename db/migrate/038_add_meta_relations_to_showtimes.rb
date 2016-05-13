class AddMetaRelationsToShowtimes < ActiveRecord::Migration
  def change
    add_reference :showtimes, :showtime_ticket_metadata, index: true, foreign_key: true, unique: true
    add_reference :showtimes, :showtime_accessibility_metadata, index: true, foreign_key: true, unique: true
  end
end
