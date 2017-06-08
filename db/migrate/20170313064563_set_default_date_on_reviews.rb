class SetDefaultDateOnReviews < ActiveRecord::Migration
  def change
    change_column :reviews, :date, :date, default: Date.today
  end
end
