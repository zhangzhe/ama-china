class AmaTopic < ActiveRecord::Base
  validates_presence_of :image, :mentor_name, :title
  belongs_to :mentor
  has_many :comments, as: :ama
  mount_uploader :image, AvatarUploader

  def questions_count
    comments.questions.count
  end

  def self.topics_in_home
    all[0..2]
  end

  def to_param
    "#{id}-#{slug}"
  end

  private
  def slug
    Pinyin.t(title.downcase).split(' ').join('-')
  end
end
