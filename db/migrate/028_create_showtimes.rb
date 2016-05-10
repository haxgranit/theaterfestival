class CreateShowtimes < ActiveRecord::Migration
  def change
    create_table :showtimes do |t|
      t.datetime :showtime
      t.references :theater, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
