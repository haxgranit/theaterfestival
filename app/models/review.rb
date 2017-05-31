class Review < ActiveRecord::Base
  belongs_to :production
  belongs_to :user

  validates :date, presence: true
end
