class AddTimeToShowtime < ActiveRecord::Migration
  def change
    add_column :showtimes, :time, :time
  end
end
