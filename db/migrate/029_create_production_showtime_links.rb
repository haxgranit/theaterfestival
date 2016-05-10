class CreateProductionShowtimeLinks < ActiveRecord::Migration
  def change
    create_table :production_showtime_links do |t|
      t.references :production, index: true, foreign_key: true
      t.references :showtime, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
