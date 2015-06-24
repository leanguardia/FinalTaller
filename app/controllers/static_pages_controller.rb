class StaticPagesController < ApplicationController

  def dashboard
    if current_user
      @band_data = User.find(current_user.id).band_data
    else
      redirect_to '/'
    end
  end

  def share
    @goal = Goal.find(params[:id])
    @percentage = (@goal.reached * 100)/ @goal.target
  end

  def home
  end

  def icons
  end

  def help
 	end
  	
  def about
  end
end
