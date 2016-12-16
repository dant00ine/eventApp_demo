class EventsController < ApplicationController
  # before_action :require_login
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    # @members = User.joins(:members).where("members.event_id = ?", @event.id)
    @event.users
  end

  def new
    # render "new"  --> by default
  end

  def create
    @event = Event.new(title:params[:title], location:params[:location])
    if @event.valid?
      @event.save
      redirect_to '/events'
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to '/events/new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
