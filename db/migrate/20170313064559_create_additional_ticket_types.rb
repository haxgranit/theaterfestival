class CreateAdditionalTicketTypes < ActiveRecord::Migration
  def change
    create_table :additional_ticket_types do |t|
      t.references :showtime, index: true, foreign_key: true
      t.string :ticket_type
      t.decimal :ticket_price
      t.text :ticket_info

      t.timestamps null: false
    end
  end
end
