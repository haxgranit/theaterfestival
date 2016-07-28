class Artist < ActiveRecord::Base
  searchkick word_start: [:stage_name], searchable: [:stage_name]
  validates :stage_name, presence: true
  validates_uniqueness_of :user_id, :allow_blank => true
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

  def social_links
    artist_social_metadata
      .try(:attributes)
      .try(:delete_if) { |_, v| v.blank? }
      .try(:except, 'id', 'artist_id', 'created_at', 'updated_at')
  end

end
