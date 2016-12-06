class AddArchivedFlagToProductions < ActiveRecord::Migration
  def change
    add_column :productions, :archived, :boolean
  end
end
