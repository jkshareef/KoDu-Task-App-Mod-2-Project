class User < ApplicationRecord
  has_many :relationships, dependent: :destroy
  has_many :friends, through: :relationships
  has_many :requests
  has_many :comments, through: :tasks
  has_many :tasks


  validates :user_name, uniqueness: true
  validates :display_name, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password


end
