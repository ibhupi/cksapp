module Api
  class LocationsController < ApplicationController

    def index
      @locations = Location.all
      render json: @locations
    end

    def show
      @location = Location.find_by(id: params[:id])
      if @location.nil?
        render json: { result: false, message: "Couldn't find Location with 'id'." }
      else
        render json: @location
      end
    end
  end
end
