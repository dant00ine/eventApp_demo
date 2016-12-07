class EventsController < ApplicationController
  def index
  end

  def show
    @event = Event.find(params[:id])
    @members = @event.members
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
