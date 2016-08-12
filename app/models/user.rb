class User < ActiveRecord::Base
  searchkick word_start: [:full_name], searchable: [:full_name]
  has_many :permissions
  include PublicActivity::Model
  tracked

  has_one :artist
  acts_as_follower
  acts_as_liker
  acts_as_mentionable
  acts_as_mentioner

  before_save { email.downcase! }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :zxcvbnable

  validates :email, :first_name, :last_name, :time_zone, presence: true
  validates :password, presence: true, confirmation: true, on: :create

  validates :email, length: { maximum: 254 }

  validate :timezone_exists

  attachment :profile_image

  def full_name
    "#{first_name} #{last_name}"
  end

  def search_data
    {
      full_name: full_name,
      email: email
    }
  end

  # def activities
  #   PublicActivity::Activity.where(owner: self)
  # end

  def liked
    Like.where(liker: self).map { |l| l.likeable }
  end

  def followed
    Follow.where(follower: self).map { |f| f.followable }
  end

  private

  def timezone_exists
    return if ActiveSupport::TimeZone[time_zone].present?
    errors.add(:time_zone, "does not exist")
  end


end
