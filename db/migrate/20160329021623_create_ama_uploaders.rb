class CreateAmaUploaders < ActiveRecord::Migration
  def change
    create_table :ama_uploaders do |t|
      t.string :image

      t.timestamps null: false
    end
  end
end
