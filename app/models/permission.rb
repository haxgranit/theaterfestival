class Permission < ActiveRecord::Base
  belongs_to :user
  belongs_to :resource, polymorphic: true

  validates :user_id, uniqueness: { scope: [:resource_type, :resource_id],
                                    message:"Permission has already been given to this user."
                                  }
  validates :resource_type, :resource_id, presence: true

end
