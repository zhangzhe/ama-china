class Comment < ActiveRecord::Base
  validates_presence_of :commenter_name, :content
  belongs_to :ama, polymorphic: true
  scope :questions, -> { where("parent_id is null") }
  has_closure_tree order: 'created_at DESC'
  after_create :notify_mentor

  def replied_by_author?
    ama.mentor_id == self.commenter_id
  end

  private
  def notify_mentor
    NotificationMailer.notify_mentor(self.ama, self).deliver_now unless replied_by_author?
  end
end
