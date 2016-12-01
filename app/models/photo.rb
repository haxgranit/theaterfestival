class Photo < ActiveRecord::Base
  belongs_to :photo_album
  attachment :photo

end
