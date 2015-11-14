class SessionController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "#{@user.username} has logged in"
      redirect_to dashboard_path
    else
      flash.now[:error] = "Invalid Credentials. Try again."
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to '/'
  end
end
