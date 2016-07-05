class Venue < ActiveRecord::Base
  searchkick word_start: [:name], searchable: [:name]
  validates :company_id, presence: true

  belongs_to :company
  has_many :theaters
  has_many :showtimes, through: :theaters
end
