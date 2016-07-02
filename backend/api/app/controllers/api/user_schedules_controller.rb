module Api
  class UserSchedulesController  < ApplicationController

    def like
      @user_schedule = UserSchedule.find_by(id: like_params[:id])
      if @user_schedule.nil?
        render json: "Couldn't find UserSchedule with 'id'"
      else
        if @user_schedule.increment!(:like)
          render json: "like is success!"
        else
          render json: "like failed"
        end
      end
    end

    def index
      @user_schedules = UserSchedule.all
      render json: @user_schedules
    end

    def create
      if user_schedule_params[:id].nil?
        # new
        @user_schedule = UserSchedule.new(user_schedule_params)
        if @user_schedule.save
          render json: @user_schedule
        else
          render json: "create failed"
        end
      else
        # update
        @user_schedule = UserSchedule.find_by(id: params[:id])
        if @user_schedule.nil?
          render json: "Couldn't find UserSchedule with 'id'"
        else
          if @user_schedule.update(user_schedule_params)
            render json: @user_schedule
          else
            render json: "update failed"
          end
        end
      end
    end

    def show
      @user_schedule = UserSchedule.find(params[:id])
      render json: @user_schedule
    end

    def destroy
      @user_schedule = UserSchedule.find_by(id: params[:id])
      if @user_schedule.nil?
        render json: "Couldn't find UserSchedule with 'id'"
      else
        @user_schedule.destroy
        render json: "destroy is success!"
      end
    end


    private
    def user_schedule_params
      params.permit(:id, :userID, :detail, :date, :like, :canShare)
    end

    def like_params
      params.permit(:id)
    end
  end
end
