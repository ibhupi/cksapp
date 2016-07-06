module Api
  class PlayersController < ApplicationController

    def index
      @players = Player.all
      render json: @players
    end

    def show
      @player = Player.find_by(id: params[:id])
      if @player.nil?
        render json: { result: false, message: "Couldn't find Player with 'id'." }
      else
        render json: @player
      end
    end
  end
end
