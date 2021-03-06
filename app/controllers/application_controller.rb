class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def require_correct_user
    @user = User.find(params[:id])
    if @user != current_user
       redirect_to "/users/#{current_user.id}"
    end
  end

  def require_login
    puts "required login"
    if session[:user_id] == nil
      redirect_to "/login"
    end
  end

  # before_action :require_login, except: [:new]

  helper_method :current_user

end
