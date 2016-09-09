class AddProductionIdToShowtimes < ActiveRecord::Migration
  def change
    add_reference :showtimes, :production, index: true, foreign_key: true
  end
end
