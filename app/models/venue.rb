class Venue < ActiveRecord::Base
  include Permissible
  include HasAlbum
  include PublicActivity::Common
  searchkick word_start: [:name], searchable: [:name]
  validates :company_id, presence: true

  belongs_to :company
  has_many :theaters
  has_many :showtimes, through: :theaters
end
