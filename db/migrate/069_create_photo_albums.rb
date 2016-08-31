class CreatePhotoAlbums < ActiveRecord::Migration
  def change
    create_table :photo_albums do |t|
      t.string :title
      t.string :description
      t.references :has_album, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
