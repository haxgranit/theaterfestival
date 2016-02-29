class User < ActiveRecord::Base
  before_save { email.downcase! }

  has_secure_password

  validates :email, :first_name, :last_name, :time_zone, presence: true
  validates :password, confirmation: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email,
            uniqueness: { case_sensitive: false },
            length: { maximum: 254 }, # http://www.rfc-editor.org/errata_search.php?rfc=3696&eid=1690
            format: { with: VALID_EMAIL_REGEX }

  validate :timezone_exists

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private

  def timezone_exists
    return if ActiveSupport::TimeZone[time_zone].present?
    errors.add(:time_zone, "does not exist")
  end
end
