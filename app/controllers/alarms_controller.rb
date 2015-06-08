class AlarmsController < ApplicationController
  before_action :set_alarm, only: [:show, :edit, :update, :destroy] 

  respond_to :html  
  def index 
    @alarms = Alarm.all
    respond_with(@alarms)
  end

  def show
    respond_with(@alarm)
  end

  def new
    @alarm = Alarm.new
    @days = Alarm.get_days
    respond_with(@alarm)
  end

  def edit
    @days = Alarm.get_days
  end

  def create
    @alarm = Alarm.new(alarm_params)
    @alarm.user_id = current_user.id
    @alarm.save
    respond_with(@alarm)
  end

  def update
    @alarm.update(alarm_params)
    respond_with(@alarm)
  end

  def destroy
    @alarm.destroy
    respond_with(@alarm)
  end

  private
    def set_alarm
      @alarm = User.find(current_user.id).alarms.find(params[:id])
    end

    def alarm_params
      params.require(:alarm).permit(:user_id, :day_week, :alarm_hour, :state, :name)
    end
end
