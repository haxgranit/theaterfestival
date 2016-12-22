class Artist < ActiveRecord::Base
  include Permissible
  include Metadata
  include SocialTarget
  include HasAlbum
  include PublicActivity::Model

  searchkick word_start: [:name], searchable: [:name]

  validates :stage_name, presence: true
  validates_uniqueness_of :user_id, :allow_blank => true

  attachment :profile_image
  attachment :banner_image
  belongs_to :user
  has_one :artist_social_metadata
  accepts_nested_attributes_for :artist_social_metadata

  has_many :credits
  accepts_nested_attributes_for :credits, reject_if: :all_blank, allow_destroy: true
  has_many :productions, -> { uniq }, through: :credits, source: :creditable,
           source_type: 'Production'

  has_many :companies, -> { uniq }, through: :credits, source: :creditable,
           source_type:'Company'


  alias_attribute :name, :stage_name

  def social_links
    collect_metadata(artist_social_metadata)
  end

  def search_data
    {
        id: id,
        name: name,
        image: Refile.attachment_url(self, :profile_image, :fill, 50, 50, format: 'jpg', fallback: 'unknown50x50.png'),
        path: "/artists/#{id}",
        credits: credits
                     .limit(4)
                     .map do |credit|
          {production: credit.creditable.name,position: credit.position}
        end
    }
  end

end
