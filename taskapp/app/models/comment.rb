class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :user
  validates :content, presence: true

  def commenter
    self.user.display_name
  end

  def time_created
    self.created_at.strftime("%b-%d-%Y, at %I:%M%p")
  end

  def time_passed
    diff = Time.now.to_i - self.created_at.to_i
    if diff / 3600 < 1 && (diff % 3600) / 60 < 1
      "Just Now"
    elsif diff / 3600 < 1
      "#{(diff % 3600) / 60}min(s)"
    else
      "#{diff / 3600} hour(s) #{(diff % 3600) / 60}min(s)"
    end
  end
end
