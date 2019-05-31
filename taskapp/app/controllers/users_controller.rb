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

      flash[:errors] = @user.errors.full_messages
      flash[:user_attributes] = @user.attributes
      render :new
    end
  end



  def search
    @users = User.all.select {|user| user.user_name.include?(params[:q])}

    render :index
  end

  def friend_list
    @friends = current_user.friend_list

    render :friends
  end













  private

  def user_params
    params.require(:user).permit(:display_name, :user_name, :password, :password_confirmation, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
