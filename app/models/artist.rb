class Artist < ActiveRecord::Base

  validates :first_name, :last_name, presence: true
  validates_uniqueness_of :user_id
  attachment :profile_image

  belongs_to :user
  has_one :artist_social_metadata
  accepts_nested_attributes_for :artist_social_metadata
  has_many :production_credits
  has_many :productions, through: :production_credits
  acts_as_followable
  acts_as_likeable
  acts_as_mentionable

  def full_name
    "#{first_name} #{last_name}"
  end

  def social_links
    artist_social_metadata
      .attributes
      .except('id', 'artist_id', 'created_at', 'updated_at')
      .delete_if { |_, v| v.empty? }
  end
end
