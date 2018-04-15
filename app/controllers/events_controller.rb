class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(name: event_params[:name])
    @event.date = Chronic.parse(event_params[:date]).utc.midnight
    if @event.save
      redirect_to calendar_path, notice: "Event #{@event.name} created"
    else
      render 'new'
    end
  end


  private
  def event_params
    params.require(:event).permit([:date, :name])
  end
end
