class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.references :artist, index: true, foreign_key: true
      t.references :creditable, polymorphic: true
      t.string :credited_as
      t.string :position
      t.date :start_date
      t.date :end_date
      t.boolean :original_cast
      t.boolean :confirmed
    end
  end
end
