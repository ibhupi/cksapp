module Api
  class EventsController < ApplicationController

    def index
      @events = Event.all
      render json: @events
    end

    def show
      @event = Event.find_by(id: params[:id])
      if @event.nil?
        render json: { result: false, message: "Couldn't find Event with 'id'." }
      else
        render json: @event
      end
    end
  end
end
