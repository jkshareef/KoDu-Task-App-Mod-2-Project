class Task < ApplicationRecord
  has_many :suggestions
  belongs_to :user
  has_many :comments

  def day
    self.date.split("-")[2].to_i
  end

  def comment_count
    self.comments.length
  end
end
