class Task < ApplicationRecord
  has_many :suggestions
  belongs_to :user
  has_many :comments

  def month
    self.date.("-")[1].to_i
  end

  def year
    self.date.("-")[0].to_i
  end

  def day
    self.date.("-")[2].to_i
  end

  def days_in_month
    Date.new(self.year, self.month, -1).day
  end

  def duration
    "#{self.start_time} to #{self.end_time}"
  end

  def comment_count
    self.comments.length
  end
end
