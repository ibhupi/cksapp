module Api
  class UsersController < ApplicationController

    def index
      @users = User.all
      render json: @users
    end


    def show
      @user = User.find_by(id: params[:id])
      if @user.nil?
        render json: { result: false, message: "Couldn't find User with 'id'." }
      else
        render json: @user
      end
    end

  end
end
