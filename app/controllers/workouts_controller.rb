class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index

    @actives = Workout.where(:user_id=>current_user.id , :end=>nil)
    @done = Workout.find_by_sql("SELECT * FROM workouts WHERE user_id=#{current_user.id } and end")

  end

  def show
    @hash = Gmaps4rails.build_markers(@workout.band_datums) do |record, marker|
      marker.lat record.latitude
      marker.lng record.longitude
    end
    respond_with(@workout)
  end

  def finish
    @workout = Workout.find(params[:id])
    @workout.end=DateTime.now
    @workout.calculate_data
    @workout.save
    redirect_to('/workouts')
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
      #params.require(:workout).permit(:user_id, :workout_type_id, :start, :end, :calories, :heartrate, :name)
      params.require(:workout).permit(:workout_type_id, :name)
    end
end
