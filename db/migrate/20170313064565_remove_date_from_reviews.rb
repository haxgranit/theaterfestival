class RemoveDateFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :date
  end
end
