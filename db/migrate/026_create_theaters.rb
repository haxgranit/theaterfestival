class CreateTheaters < ActiveRecord::Migration
  def change
    create_table :theaters do |t|
      t.text :name
      t.text :description
      t.references :venue, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
