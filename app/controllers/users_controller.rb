class UsersController < ApplicationController
  def index
    @allUsers = User.all
  end
  def show
    @user = User.where(id: params[:id]).first
    @eventsOwned = Event.where(user: @user)
    @eventsAttended = Event.joins(:members).where("members.user_id = ?", @user.id)
    render '/users/show.html.erb'
  end
  def new
  end
  def create
    reset_session
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome the eventApp, #{@user.name}"
      redirect_to "/events"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/register"
    end
  end
  def edit
  end
  def update
  end
  # private
    def user_params
      params.require(:user).permit(:name, :email, :password, :age)
    end
end
