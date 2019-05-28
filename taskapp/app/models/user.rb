class User < ApplicationRecord
  has_many :relationships, dependent: :destroy
  has_many :friends, through: :relationships






end
