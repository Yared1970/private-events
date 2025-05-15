class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.find(params[:event_id])
    Attendance.create!(attendee: current_user, attended_event: event)
    redirect_to event_path(event), notice: "You are now attending this event!"
  end
end
