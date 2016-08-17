class Credit < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :artist
  belongs_to :production

  validates :artist, :production, :position, :start_date, presence: true

  scope :production_credits, -> { where(type: 'ProductionCredit') }
  scope :writing_credits, -> { where(type: 'WritingCredit') }
  scope :staff_credits, -> { where(type: 'StaffCredit') }
end
