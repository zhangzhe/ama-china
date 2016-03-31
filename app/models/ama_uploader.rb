class AmaUploader < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
  validates_presence_of :image
end
