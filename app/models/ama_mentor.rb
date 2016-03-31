class AmaMentor < ActiveRecord::Base
  validates_presence_of :avatar, :mentor_name, :mentor_title, :content, :brief
  belongs_to :mentor
  has_many :comments, as: :ama
  mount_uploader :avatar, AvatarUploader

  def questions_count
    comments.questions.count
  end
end
