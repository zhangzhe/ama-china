class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter_name
      t.integer :commenter_id
      t.text :content
      t.integer :ama_id
      t.string :ama_type
      t.integer :parent_id
      t.timestamps null: false
    end
  end
end
