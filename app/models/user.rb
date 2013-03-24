class User < ActiveRecord::Base
  attr_accessible :email, :name_first, :name_last, :name_middle, :user_name, :password, :password_confirmation
  has_secure_password

  before_save { email.downcase! }
  before_save { user_name.downcase! }

  validates :name_first, presence: true, length: { maximum: 25 }
  validates :name_last, presence: true, length: { maximum: 25 } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
  							uniqueness: { case_sensitive: false }
  validates :user_name, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
