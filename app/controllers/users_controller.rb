class UsersController < ApplicationController
  def show
    @user = User.where(id: params[:id]).first
    @eventsOwned = Event.where(user: @user)
    render '/users/show.html.erb'
  end
  def edit
  end
  def update
  end
end
