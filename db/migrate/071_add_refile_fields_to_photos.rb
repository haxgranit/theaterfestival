class AddRefileFieldsToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :photo_id, :string
    add_column :photos, :photo_filename, :string
    add_column :photos, :photo_size, :integer
    add_column :photos, :photo_content_type, :string
  end
end
