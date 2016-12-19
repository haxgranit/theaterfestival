class Festival < ActiveRecord::Base
  cattr_accessor :form_steps do
    %w(timing festival_title company festival_data festival_shows festival_info)
  end

  attr_accessor :form_step

  include Permissible
  include HasAlbum
  include PublicActivity::Common
  searchkick word_start: [:title], searchable: [:title]
  validates :title, presence: true
  attachment :festival_image
  attachment :banner_image

  has_many :companies, through: :company_festival_links
  has_many :productions, through: :festival_production_links
  has_many :company_festival_links
  has_many :festival_production_links
end
