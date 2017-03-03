class User < ActiveRecord::Base
  searchkick word_start: [:name], searchable: [:name]
  has_many :permissions
  include PublicActivity::Common

  has_one :company
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

  validates :email, :first_name, :last_name, presence: true
  validates :password, presence: true, confirmation: true, on: :create

  validates :email, length: { maximum: 254 }

  attachment :profile_image
  attachment :banner_image

  def full_name
    "#{first_name} #{last_name}"
  end

  def name
    full_name
  end


  def search_data
    {
        id: id,
        name: full_name,
        path: "/users/#{id}",
        image: Refile.attachment_url(self, :profile_image, :fill, 50, 50, format: 'jpg') || ActionController::Base.helpers.asset_url('unknown50x50.png'),
    }
  end

  def public_activities
    PublicActivity::Activity.where(owner: self).order(created_at: :desc)
  end

  def follower_activities
    acts = Array.new
    self.followed.each do |f|
      acts << PublicActivity::Activity.where(owner: f)
    end
    acts.flatten.sort_by(&:created_at).reverse!
  end

  def liked
    Like.where(liker: self).map { |l| l.likeable }
  end

  def likers
    Like.where(likeable: self).map { |l| l.liker }
  end

  def followed
    Follow.where(follower: self).map { |f| f.followable }
  end

  def followers
    Follow.where(followable: self).map { |f| f.follower }
  end

  private

end
