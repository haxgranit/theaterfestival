class DropAdditionalTicketTypeFromShowtimeTicketMetadata < ActiveRecord::Migration
  def change
    change_table(:showtime_ticket_metadata) do |t|
      t.remove :additional_ticket_type
      t.remove :additional_ticket_type_price
      t.remove :additional_ticket_type_info
    end
  end
end
