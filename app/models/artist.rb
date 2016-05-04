class Artist < ActiveRecord::Base
  belongs_to :user
  has_one :artist_social_metadata
  has_many :production_credits
  has_many :productions, through: :production_credits
  acts_as_followable
  acts_as_likeable
  acts_as_mentionable
end
