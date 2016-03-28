class AddImageToAmaTopics < ActiveRecord::Migration
  def change
    add_column :ama_topics, :image, :string
  end
end
