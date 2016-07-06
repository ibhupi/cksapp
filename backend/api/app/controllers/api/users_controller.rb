module Api
  class UsersController < ApplicationController

    def index
      @users = User.all
      render json: @users
    end

    def create
      # new
      @user = User.new(user_params)
      if @user.save
        render json: @user
      else
        render json: { result: false, message: "Create User is failed." }
      end
    end

    def show
      @user = User.find_by(id: params[:id])
      if @user.nil?
        render json: { result: false, message: "Couldn't find User with 'id'." }
      else
        render json: @user
      end
    end

    def new
      @user = User.new(name: "hoge", photo: "hoge.jpg")
      if @user.save
        render json: @user
      else
        render json: { result: false, message: "Create User is failed." }
      end
    end

    private
    def user_params
      params.permit(:name, :photo)
    end
  end
end
