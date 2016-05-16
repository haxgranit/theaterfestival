class FixAllIndicesBecauseImStupid < ActiveRecord::Migration
  def change
    remove_reference :theaters, :theater_metadata
    add_reference :theater_metadata, :theater, index: {:unique=>true}, foreign_key: true
    remove_reference :showtimes, :showtime_ticket_metadata
    add_reference :showtime_ticket_metadata, :showtime, index: {:unique=>true}, foreign_key: true
    remove_reference :showtimes, :showtime_accessibility_metadata
    add_reference :showtime_accessibility_metadata, :showtime, index: {:unique=>true}, foreign_key: true
    remove_reference :artists, :artist_social_metadata
    add_reference :artist_social_metadata, :artist, index: {:unique=>true}, foreign_key: true
  end
end
