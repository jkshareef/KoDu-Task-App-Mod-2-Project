class Request < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates :user_id, presence: true
  validates :friend_id, presence: true

  def self.create_request(user_id, friend_id)
    sent_request = self.create(user_id: user_id, friend_id: friend_id)
    received_request = self.create(user_id: friend_id, friend_id: user_id)
  end


end
