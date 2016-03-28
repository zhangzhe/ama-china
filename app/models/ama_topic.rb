class AmaTopic < ActiveRecord::Base
  belongs_to :mentor
  has_many :comments, as: :ama
  mount_uploader :image, AvatarUploader

  def questions_count
    comments.questions.count
  end

  def self.topics_in_home
    all[0..2]
  end
end
