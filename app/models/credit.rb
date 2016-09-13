class Credit < ActiveRecord::Base
  attr_accessor :title
  include PublicActivity::Model
  tracked owner: :artist, recipient: :creditable

  belongs_to :artist
  belongs_to :creditable, polymorphic: true
  enum credit_type: [:production, :creative, :staff]


  validates :artist, :creditable, :position, :start_date, presence: true

end
