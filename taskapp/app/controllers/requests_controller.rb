class RequestsController < ApplicationController

  def new
  end

  def create
    @user = User.find(params[:id])
    Request.create_request(@user.id, current_user)
  end
end
