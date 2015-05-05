class GoalRangesController < ApplicationController
  before_action :set_goal_range, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @goal_ranges = GoalRange.all
    respond_with(@goal_ranges)
  end

  def show
    respond_with(@goal_range)
  end

  def new
    @goal_range = GoalRange.new
    respond_with(@goal_range)
  end

  def edit
  end

  def create
    @goal_range = GoalRange.new(goal_range_params)
    @goal_range.save
    respond_with(@goal_range)
  end

  def update
    @goal_range.update(goal_range_params)
    respond_with(@goal_range)
  end

  def destroy
    @goal_range.destroy
    respond_with(@goal_range)
  end

  private
    def set_goal_range
      @goal_range = GoalRange.find(params[:id])
    end

    def goal_range_params
      params.require(:goal_range).permit(:goal_id, :start_time, :end_time)
    end
end
