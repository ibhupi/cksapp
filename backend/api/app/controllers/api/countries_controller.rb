module Api
  class CountriesController < ApplicationController

    def index
      @countries = Country.all
      render json: @countries
    end


    def show
      @country = Country.find_by(id: params[:id])
      if @country.nil?
        render json: { result: false, message: "Couldn't find Country with 'id'." }
      else
        render json: @country
      end
    end

  end
end
