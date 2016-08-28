class DestroyCredits < ActiveRecord::Migration
  def change
    drop_table :credits do |t|
      t.references :artist, index: true, foreign_key: true
      t.references :production, index: true, foreign_key: true
      t.text :name
      t.text :position
      t.date :start_date
      t.date :end_date
      t.text :type
      t.boolean :confirmed
      t.boolean :original

      t.timestamps null: false
    end
  end
end
