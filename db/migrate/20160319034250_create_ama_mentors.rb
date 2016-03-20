class CreateAmaMentors < ActiveRecord::Migration
  def change
    create_table :ama_mentors do |t|
      t.string :mentor_avatar
      t.string :mentor_name
      t.string :mentor_title
      t.text :mentor_brief
      t.text :content
      t.integer :mentor_id

      t.timestamps null: false
    end
  end
end
