class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates :user_id, presence: true
  validates :friend_id, presence: true





  def self.create_reciprocal_for_ids(user_id, friend_id)

    user_friendship = Relationship.create(user_id: user_id, friend_id: friend_id)
    friend_friendship = Relationship.create(user_id: friend_id, friend_id: user_id)
    Request.where(user_id: user_id, friend_id: friend_id).destroy_all
    Request.where(user_id: friend_id, friend_id: user_id).destroy_all
  end

  def self.destroy_reciprocal_for_ids(user_id, friend_id)
    friendship1 = Relationship.find_by(user_id: user_id, friend_id: friend_id)
    friendship2 = Relationship.find_by(user_id: friend_id, friend_id: user_id)
    friendship1.destroy
    friendship2.destroy
  end

end
