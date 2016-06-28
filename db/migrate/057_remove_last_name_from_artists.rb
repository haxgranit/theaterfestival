class RemoveLastNameFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :last_name
    rename_column :artists, :first_name, :stage_name
  end
end
