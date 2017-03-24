class AddMinimumPriceToShowtimeTicketMetadata < ActiveRecord::Migration
  def change
    add_column :showtime_ticket_metadata, :minimum_price, :numeric
  end
end
