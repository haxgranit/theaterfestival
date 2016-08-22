class Credit < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :artist, inverse_of: :credits
  belongs_to :production, inverse_of: :credits

  validates :artist, :production, :position, :start_date, presence: true

  scope :production_credits, -> { where(type: 'ProductionCredit') }
  scope :writing_credits, -> { where(type: 'WritingCredit') }
  scope :staff_credits, -> { where(type: 'StaffCredit') }
end
