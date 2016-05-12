class AddIndexToArtists < ActiveRecord::Migration
  def change
    remove_index :artists, :user_id
    add_index :artists, :user_id, unique: true
  end
end
