class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find(username: params[:session][:username])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Successful Log In. Welcome, #{@user.username}"
      redirect_to tools_path
    else
      flash[:error] = "Log In Unsucessful - Try Again"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Logged Out"
    redirect_to tools_path
  end
end
