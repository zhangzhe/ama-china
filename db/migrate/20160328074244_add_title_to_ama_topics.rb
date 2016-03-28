class AddTitleToAmaTopics < ActiveRecord::Migration
  def change
    add_column :ama_topics, :title, :string
  end
end
