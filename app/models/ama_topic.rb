class AmaTopic < ActiveRecord::Base
  has_many :comments, as: :ama
end
