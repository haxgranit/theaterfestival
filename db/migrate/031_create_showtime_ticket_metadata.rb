class CreateShowtimeTicketMetadata < ActiveRecord::Migration
  def change
    create_table :showtime_ticket_metadata do |t|
      t.numrange :guaranteed_price
      t.text :guaranteed_price_note
      t.text :ticket_link
      t.text :reservation_link
      t.text :reservation_link_info
      t.text :reservation_phone
      t.text :reservation_phone_info
      t.text :in_person_ticketing_info
      t.text :special_event
      t.text :special_event_info
      t.text :additional_ticket_type
      t.numrange :additional_ticket_type_price
      t.text :additional_ticket_type_info
      t.text :notes

      t.timestamps null: false
    end
  end
end
