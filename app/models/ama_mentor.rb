class AmaMentor < ActiveRecord::Base
  belongs_to :mentor
  mount_uploader :avatar, AvatarUploader
end
