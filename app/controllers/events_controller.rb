class EventsController < ApplicationController
  def index
    @events = Event.order("begin_date")
  end

  def show
    @event = Event.find(params[:id]).decorate
  end
end
