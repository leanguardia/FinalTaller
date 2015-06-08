class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if current_user
      @goals = User.find(current_user.id).goals
      @goals.each do |goal|
        Goal.calculate_measure(current_user.id, goal)
      end
      respond_with(@goals)
    else
      redirect_to '/'
    end
  end

  def show
    @percentage = (@goal.reached * 100)/ @goal.target
    respond_with(@goal)
  end

  def history
    @goals = Goal.generate_history(current_user.id, params[:id]).paginate(page: params[:page], per_page: 10)
  end

  def new
    @goal = Goal.new
    @types = Goal.get_types
    @times = Goal.get_times
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

  # def update
  #   @goal.update(goal_params)
  #   respond_with(@goal)
  # end

  def destroy
    @goal.destroy
    respond_with(@goal)
  end

  private
  def set_goal
    @goal =  User.find(current_user.id).goals.find(params[:id])
    # @goal = Goal.find(params[:id])
  end

  def goal_params
    # params.require(:goal).permit(:start_date, :interval, :target, :reached, :goal_type_id, :user_id_id)
    params.require(:goal).permit(:interval, :target, :goal_type_id)
  end
end
