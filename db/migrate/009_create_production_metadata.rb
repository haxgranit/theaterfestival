class CreateProductionMetadata < ActiveRecord::Migration
  def change
    create_table :production_metadata do |t|
      t.references :production, index: true, foreign_key: true
      t.text :performance_type
      t.text :info_heading
      t.text :info
      t.text :warnings
      t.text :warning_info
      t.text :running_time
      t.text :intermissions

      t.timestamps null: false
    end
  end
end
