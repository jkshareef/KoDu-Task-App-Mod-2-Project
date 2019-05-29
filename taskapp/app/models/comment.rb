class Comment < ApplicationRecord
  belongs_to :task

  def commenter
    self.task.user.display_name
  end
end
