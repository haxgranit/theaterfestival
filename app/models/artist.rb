class Artist < ActiveRecord::Base
  belongs_to :user
  acts_as_followable
  acts_as_likeable
  acts_as_mentionable
end
