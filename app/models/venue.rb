class Venue < ActiveRecord::Base
  validates :company_id, presence: true

  belongs_to :company
  has_many :theaters
  has_many :showtimes, through: :theaters
end
