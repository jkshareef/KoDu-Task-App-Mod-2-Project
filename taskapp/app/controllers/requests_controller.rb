class RequestsController < ApplicationController

  def new
    @request = Request.new
  end



  def create
    @user = User.find(params[:id])

    if Request.create_request(@user.id, current_user.id)
      redirect_to current_user
    else
      redirect_to @user
    end
  end

  def received


    @requests = Request.where(user_id: current_user)

    #
    # @users.each do |user|
    #   @requests << user.requests.where(friend_id: current_user)
    # end
  
    render  :received
  end

  def sent
    @requests = current_user.requests

    render :sent
  end
end
