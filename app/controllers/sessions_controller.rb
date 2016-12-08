class SessionsController < ApplicationController
  def new
  end

  def create
    reset_session
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "successfully logged in, welcome #{@user.name}"
      redirect_to "/events"
    else
      flash[:errors] = ["Invalid Credentials", "No matching record for supplied email and password"]
      redirect_to "/login"
    end
  end

  def destroy
    reset_session
    redirect_to "/login"
  end
end
