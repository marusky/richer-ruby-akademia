class User < ApplicationRecord
  has_secure_password

  validates :given_name, :family_name, :email, presence: true
end
