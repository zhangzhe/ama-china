class AmaUploader < ActiveRecord::Base
  mount_uploader :image, AvatarUploader
end
