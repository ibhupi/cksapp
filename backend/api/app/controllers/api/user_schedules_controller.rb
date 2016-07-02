module Api
  class UserSchedulesController  < ApplicationController

    def index
      @user_schedules = UserSchedule.all
      render json: @user_schedules
    end

    def show
      @user_schedule = UserSchedule.find(params[:id])
      render json: @user_schedule
    end

    def create
      if user_schedule_params[:id].nil?
        @user_schedule = UserSchedule.new(user_schedule_params)
        if @user_schedule.save
          render json: @user_schedule
        else
          render json: "create failed"
        end
      else
        @user_schedule = UserSchedule.find(params[:id])
        if @user_schedule.update(user_schedule_params)
          render json: @user_schedule
        else
          render json: "update failed"
        end
      end

    end

    def destroy
      @user_schedule = UserSchedule.find_by(id: params[:id])
      if @user_schedule.nil?
        render json: "destroy failed"
      else
        @user_schedule.destroy
        render json: "destroy successed"
      end
    end

    private

    def user_schedule_params
      params.permit(:id, :userID, :detail, :date, :like, :canShare)
    end
  end
end
