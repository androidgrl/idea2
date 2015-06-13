class User < ActiveRecord::Base
  validates :username, presence: true
  validates :password_digest, presence: true

  has_many :ideas
end
