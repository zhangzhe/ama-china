class RenameAvatarForAmaMentors < ActiveRecord::Migration
  def change
    rename_column :ama_mentors, :mentor_avatar, :avatar
  end
end
