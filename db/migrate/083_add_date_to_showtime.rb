class AddDateToShowtime < ActiveRecord::Migration
  def change
    add_column :showtimes, :date, :date
  end
end
