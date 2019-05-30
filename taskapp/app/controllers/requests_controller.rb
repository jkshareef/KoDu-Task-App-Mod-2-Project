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
    @requests = current_user.received_requests
  end

  def sent
    @requests = current_user.sent_requests
    render :sent
  end
end
