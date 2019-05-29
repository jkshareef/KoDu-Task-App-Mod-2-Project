class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :show, :update]

  def index

  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Task App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def friends
    Relationship.create_reciprocal_for_ids(:user_id, :friend_id)
  end
  












  private

  def user_params
    params.require(:user).permit(:display_name, :user_name, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
