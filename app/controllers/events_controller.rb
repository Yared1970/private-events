class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all
  end

  def new
    @event = current_user.created_events.build
  end

  def show
    @event = Event.find(params[:id])
  end


  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to events_path, notice: "Event created successfully!"
    else
      render :new, alert: "Something went wrong."
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :date)
  end
end
