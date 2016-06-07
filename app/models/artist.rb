class Artist < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  validates_uniqueness_of :user_id
  attachment :profile_image

  belongs_to :user
  has_one :artist_social_metadata
  accepts_nested_attributes_for :artist_social_metadata
  has_many :credits
  delegate :writing_credits, :production_credits, to: :credits
  has_many :productions, -> { uniq }, through: :credits
  has_many :pictures, as: :has_image
  accepts_attachments_for :pictures, attachment: :image
  accepts_nested_attributes_for :pictures
  acts_as_followable
  acts_as_likeable
  acts_as_mentionable

  def full_name
    "#{first_name} #{last_name}"
  end

  def social_links
    if artist_social_metadata.present?
      artist_social_metadata
        .attributes
        .except('id', 'artist_id', 'created_at', 'updated_at')
        .delete_if { |_, v| v.blank? }
    end
  end
end
