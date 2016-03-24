class AddBriefToAmaMentors < ActiveRecord::Migration
  def change
    add_column :ama_mentors, :brief, :text
  end
end
