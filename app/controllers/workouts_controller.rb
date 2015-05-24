class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    #@active_wos = Workout.where(user_id:current_user.id , end:nil)
    @workouts = Workout.where(user_id:current_user.id)
    @actives = Array.new #current workouts
    @done = Array.new #Done workouts
    @workouts.each do |workout|
      if workout.end == nil
        @actives << workout
      else
        @done << workout
      end
    end
    #respond_with(@workouts)
  end

  def show
    respond_with(@workout)
  end

  def new
    @workout = Workout.new
    @types = Workout.get_types()
    respond_with(@workout)
  end

  def edit
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id
    @workout.start = DateTime.now
    @workout.save
    respond_with(@workout)
  end

  def update
    @workout.update(workout_params)
    respond_with(@workout)
  end

  def destroy
    @workout.destroy
    respond_with(@workout)
  end

  private
    def set_workout
      @workout = Workout.find(params[:id])
    end

    def workout_params
      #params.require(:workout).permit(:user_id, :work_type_id, :start, :end, :calories, :heartrate, :name)
      params.require(:workout).permit(:workout_type_id, :name)
    end
end
