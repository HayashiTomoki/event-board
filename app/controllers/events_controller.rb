class EventsController < ApplicationController
  def create
  end

  def list
    @event = Event.all
  end
end
