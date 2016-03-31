class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable
  validates_presence_of :email
  validates :email, uniqueness: { message: '用户已存在，请使用其他邮箱注册。' }
end
