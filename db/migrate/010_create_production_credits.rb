class CreateProductionCredits < ActiveRecord::Migration
  def change
    create_table :production_credits do |t|
      t.references :artist, index: true, foreign_key: true
      t.references :production, index: true, foreign_key: true
      t.text :name
      t.text :position
      t.date :start_date
      t.date :end_date
      t.text :type
      t.boolean :confirmed

      t.timestamps null: false
    end
  end
end
