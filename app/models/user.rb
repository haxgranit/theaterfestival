class User < ActiveRecord::Base
  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_likeable
  acts_as_mentionable
  acts_as_mentioner

  before_save { email.downcase! }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :zxcvbnable

  validates :email, :first_name, :last_name, :time_zone, presence: true
  validates :password, confirmation: true

  validates :email, length: { maximum: 254 }

  validate :timezone_exists

  private

  def timezone_exists
    return if ActiveSupport::TimeZone[time_zone].present?
    errors.add(:time_zone, "does not exist")
  end
end
