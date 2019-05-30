class User < ApplicationRecord
  has_many :relationships, dependent: :destroy
  has_many :friends, through: :relationships
  has_many :requests
  has_many :tasks
  has_many :comments





  validates :user_name, presence: true, uniqueness: true
  validates :display_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }


  has_secure_password

  def top_tasks
    # d = Time.new
    # array = []
    # final_list = []
    # byebug
    # array << tasks.min_by {|t| (t.date.split('-')[1].to_i - d.strftime("%F").split('-')[1].to_i).abs}
    #
    #
    # final_list << array.min_by  {|t| (t.date.split('-')[2].to_i - d.strftime("%F").split('-')[2].to_i).abs}

    tasks.where(urgent: true)
    # final_list
  end

  def sent_requests
    @requests = Request.all.where(friend_id: self.id)
  end

  def received_requests
    @requests = Request.all.where(user_id: self.id)
  end



end
