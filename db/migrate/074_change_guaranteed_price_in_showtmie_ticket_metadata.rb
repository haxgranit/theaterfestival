class ChangeGuaranteedPriceInShowtmieTicketMetadata < ActiveRecord::Migration
  def change
    remove_column :showtime_ticket_metadata, :guaranteed_price
    add_column :showtime_ticket_metadata, :guaranteed_price, :decimal
  end
end
