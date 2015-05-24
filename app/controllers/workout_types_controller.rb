class WorkoutTypesController < ApplicationController
  before_action :set_workout_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @workout_types = WorkoutType.all
    respond_with(@workout_types)
  end

  def show
    respond_with(@workout_type)
  end

  def new
    @workout_type = WorkoutType.new
    respond_with(@workout_type)
  end

  def edit
  end

  def create
    @workout_type = WorkoutType.new(workout_type_params)
    @workout_type.save
    respond_with(@workout_type)
  end

  def update
    @workout_type.update(workout_type_params)
    respond_with(@workout_type)
  end

  def destroy
    @workout_type.destroy
    respond_with(@workout_type)
  end

  private
    def set_workout_type
      @workout_type = WorkoutType.find(params[:id])
    end

    def workout_type_params
      params.require(:workout_type).permit(:typename, :outside)
    end
end
