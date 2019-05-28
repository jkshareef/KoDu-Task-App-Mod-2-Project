class Task < ApplicationRecord
  has_many :suggestions
  belongs_to :user
end
