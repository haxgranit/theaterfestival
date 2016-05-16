class RemoveTheaterIdFromTheaterMetadata < ActiveRecord::Migration
  def change
    remove_reference :theater_metadata, :theater, index: true, foreign_key: true
  end
end
