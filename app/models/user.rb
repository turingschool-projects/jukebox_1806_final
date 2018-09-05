class User < ApplicationRecord
  validates_presence_of :password
  validates :username, presence: true, uniqueness: true

  has_secure_password

  enum role: ["default", "admin"]
end
