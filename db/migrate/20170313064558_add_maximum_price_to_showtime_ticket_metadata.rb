class AddMaximumPriceToShowtimeTicketMetadata < ActiveRecord::Migration
  def change
    add_column :showtime_ticket_metadata, :maximum_price, :numeric
  end
end
