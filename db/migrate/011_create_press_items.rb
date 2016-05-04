class CreatePressItems < ActiveRecord::Migration
  def change
    create_table :press_items do |t|
      t.references :production, index: true, foreign_key: true
      t.date :date
      t.text :publication
      t.text :quote
      t.text :author
      t.text :link

      t.timestamps null: false
    end
  end
end
