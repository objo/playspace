class EventsController < ApplicationController
  def new
    @event = Event.new
    @friends = current_user.active_relationships.map { |r| r.followed }
  end

  def create
    @event = Event.new(name: event_params[:name])
    @event.date = Chronic.parse(event_params[:date]).utc.midnight
    @event.start_time = event_params[:start_time]
    @event.end_time = event_params[:end_time]
    @event.description = event_params[:description]
    if @event.save
      redirect_to calendar_path, notice: "Event #{@event.name} created"
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params["id"])
  end


  private
  def event_params
    params.require(:event).permit([:date, :name, :start_time, :end_time, :description])
  end
end
