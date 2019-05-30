class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :user

  def commenter
    self.user.display_name
  end
end
