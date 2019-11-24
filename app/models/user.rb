class User < ApplicationRecord
  has_secure_password
  has_many :boards, foreign_key: :user_id

  validates_presence_of :username, :email, :password_digest

end
