class AddIndexToTheaters < ActiveRecord::Migration
  def change
    add_reference :theaters, :theater_metadata, index: {:unique=>true}, foreign_key: true
  end
end
