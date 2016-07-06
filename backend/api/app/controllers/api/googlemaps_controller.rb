module Api
  class GooglemapsController < ApplicationController

    def direction

      key = "AIzaSyDskmF9XuoEgif4OdVY2pujdxkvogO8HdE"
      origin = "Tokyo Metropolitan Gymnasium"
      destination = "Tokyo Dome"

      gmaps = GoogleMapsService::Client.new(key: key)
      routes = gmaps.directions(
        '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA',
        '2400 Amphitheatre Parkway, Mountain View, CA 94043, USA',
        mode: 'walking',
        alternatives: false)
      render json: routes
    end
  end
end
