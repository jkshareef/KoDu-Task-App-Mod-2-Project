class User < ApplicationRecord
  has_many :relationships, dependent: :destroy
  has_many :friends, through: :relationships

  validates :user_name, uniqueness: true
  validates :display_name, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }


end
