class Permission < ActiveRecord::Base
  belongs_to :user
  belongs_to :resource, polymorphic: true

  scope :production, -> { where(resource_type: 'Production') }
  scope :company, -> { where(resource_type: 'Company') }
  scope :venue, -> { where(resource_type: 'Venue') }
  scope :festival, -> { where(resource_type: 'Festival') }

  validates :user_id, uniqueness: { scope: [:resource_type, :resource_id],
                                    message:"Permission has already been given to this user."
                                  }
  validates :resource, presence: true

  def name
    resource.name
  end

end
