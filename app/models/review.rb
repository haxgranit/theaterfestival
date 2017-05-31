class Review < ActiveRecord::Base
  belongs_to :production
  belongs_to :user

  validates :title, :date, presence: true
end
