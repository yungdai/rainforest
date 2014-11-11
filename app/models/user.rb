class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  has_many :products, through: :reviews
  # validates that a user has a :username and email in order to log in.
  validates :username, :email, presence: true
end
