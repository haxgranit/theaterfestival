class AddProfileImageToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :profile_image_id, :string
  end
end
