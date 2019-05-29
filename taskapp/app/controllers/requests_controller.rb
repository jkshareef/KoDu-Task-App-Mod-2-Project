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
end
