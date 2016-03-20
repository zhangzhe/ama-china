class RemoveMentorBriefFromAmaMentors < ActiveRecord::Migration
  def change
    remove_column :ama_mentors, :mentor_brief
  end
end
