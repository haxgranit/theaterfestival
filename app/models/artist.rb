class Artist < ActiveRecord::Base
  include Permissible
  include Metadata
  include SocialTarget
  include HasAlbum
  include PublicActivity::Model

  searchkick word_start: [:stage_name], searchable: [:stage_name]

  validates :stage_name, presence: true
  validates_uniqueness_of :user_id, :allow_blank => true

  attachment :profile_image
  belongs_to :user
  has_one :artist_social_metadata
  accepts_nested_attributes_for :artist_social_metadata

  has_many :credits
  accepts_nested_attributes_for :credits, reject_if: :all_blank, allow_destroy: true
  has_many :productions, -> { uniq }, through: :credits, source: :creditable,
           source_type: 'Production'

  has_many :companies, -> { uniq }, through: :credits, source: :creditable,
           source_type:'Company'

  has_many :pictures, as: :has_image
  accepts_attachments_for :pictures, attachment: :image
  accepts_nested_attributes_for :pictures

  alias_attribute :name, :stage_name

  def social_links
    collect_metadata(artist_social_metadata)
  end

end
