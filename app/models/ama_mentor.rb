class AmaMentor < ActiveRecord::Base
  belongs_to :mentor
  has_many :comments, as: :ama
  mount_uploader :avatar, AvatarUploader

  def questions_count
    comments.questions.count
  end
end
