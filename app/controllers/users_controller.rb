class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(current_user.id)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.username.capitalize}"
      redirect_to dashboard_path
    else
      # something if the user is not valid
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
