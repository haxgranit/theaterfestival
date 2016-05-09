class Venue < ActiveRecord::Base
  belongs_to :company
  has_many :theaters
  has_many :showtimes, through: :theaters
end
