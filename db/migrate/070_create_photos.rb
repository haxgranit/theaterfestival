class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :description
      t.string :credit
      t.date :photo_date
      t.references :photo_album, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
