class User < ActiveRecord::Base
  searchkick word_start: [:name], searchable: [:name]
  scope :search_import, -> { where(public: true) }
  has_many :permissions
  include PublicActivity::Common

  has_many :companies
  has_one :artist
  has_many :reviews
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

  mount_uploader :profile_picture, ProfileImageUploader

  attachment :profile_image
  attachment :banner_image

  def all_companies
    owned = companies
    permitted = permissions.company.map(&:resource)
    owned + permitted
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def name
    full_name
  end

  def potential_matches
    Artist.where(stage_name: full_name, user_id: nil).where.not(id: self.try(:artist).try(:id))
  end

  def should_index?
    public && artist.blank?
  end

  def to_jq_upload
    {
      "name" => read_attribute(:profile_picture),
      "size" => profile_picture.size,
      "url" => profile_picture.url,
      "thumbnail_url" => profile_picture.url,
      "delete_type" => "DELETE"
    }
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
