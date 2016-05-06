class CreateFestivalProductionLinks < ActiveRecord::Migration
  def change
    create_table :festival_production_links do |t|
      t.references :festival, index: true, foreign_key: true
      t.references :production, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
