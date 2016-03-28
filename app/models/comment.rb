class Comment < ActiveRecord::Base
  belongs_to :ama, polymorphic: true
  validates_presence_of :content
  scope :questions, -> { where("parent_id is null") }
  has_closure_tree order: 'created_at DESC'

  def replied_by_author?
    ama.mentor_id == self.commenter_id
  end
end
