class AddArchivedFlagToFestivals < ActiveRecord::Migration
  def change
    add_column :festivals, :archived, :boolean
  end
end
