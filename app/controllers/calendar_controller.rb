class CalendarController < ApplicationController
  def show
    @events_by_date = Event.all.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
