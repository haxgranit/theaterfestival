class Picture < ActiveRecord::Base
  belongs_to :has_image, polymorphic: true
  attachment :image
end
