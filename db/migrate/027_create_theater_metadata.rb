class CreateTheaterMetadata < ActiveRecord::Migration
  def change
    create_table :theater_metadata do |t|
      t.references :theater, index: true, foreign_key: true
      t.integer :seat_capacity
      t.boolean :hearing_devices
      t.text :hearing_devices_info
      t.boolean :translation_devices
      t.text :translation_devices_info
      t.boolean :wheelchair_accessible
      t.text :wheelchair_accessible_info
      t.boolean :guide_dogs
      t.text :guide_dogs_info

      t.timestamps null: false
    end
  end
end
