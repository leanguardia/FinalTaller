class GoalTypesController < ApplicationController
  before_action :set_goal_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @goal_types = GoalType.all
    respond_with(@goal_types)
  end

  def show
    respond_with(@goal_type)
  end

  def new
    @goal_type = GoalType.new
    respond_with(@goal_type)
  end

  def edit
  end

  def create
    @goal_type = GoalType.new(goal_type_params)
    @goal_type.save
    respond_with(@goal_type)
  end

  def update
    @goal_type.update(goal_type_params)
    respond_with(@goal_type)
  end

  def destroy
    @goal_type.destroy
    respond_with(@goal_type)
  end

  private
    def set_goal_type
      @goal_type = GoalType.find(params[:id])
    end

    def goal_type_params
      params.require(:goal_type).permit(:description, :unit_measured)
    end
end
