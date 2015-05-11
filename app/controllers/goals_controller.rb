class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @goals = User.find(current_user.id).goals
    respond_with(@goals)
  end

  def show
    respond_with(@goal)
  end

  def new
    @goal = Goal.new
    @type = Array.new
    GoalType.all.each do |x|
      @type << [x.typename, x.id]
    end

    @times = Array.new
    @times << ["1 day", 1]
    @times << ["1 week", 2]
    @times << ["1 month", 3]
    @times << ["3 months", 4]
    @times << ["6 months", 5]
    @times << ["1 year", 6]

    respond_with(@goal)
  end

  def edit
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    @goal.save
    respond_with(@goal)
  end

  def update
    @goal.update(goal_params)
    respond_with(@goal)
  end

  def destroy
    @goal.destroy
    respond_with(@goal)
  end

  private
  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    # params.require(:goal).permit(:start_date, :end_date, :target, :reached, :goal_type_id, :user_id_id)
    params.require(:goal).permit(:end_date, :target, :goal_type_id)
  end
end
