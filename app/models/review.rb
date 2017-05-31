class Review < ActiveRecord::Base
  belongs_to :production
  belongs_to :user

  validate :date, presence: true
end
