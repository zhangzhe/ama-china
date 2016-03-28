class CreateAmaTopics < ActiveRecord::Migration
  def change
    create_table :ama_topics do |t|
      t.text :content
      t.string :mentor_name
      t.integer :mentor_id

      t.timestamps null: false
    end
  end
end
