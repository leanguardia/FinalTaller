class StaticPagesController < ApplicationController

  def dashboard
    @form = Date.today
    @to = Date.today
    desde = params[:from]
    hasta = params[:to]
    if !desde
      @band_data = User.find(current_user.id).band_data
    else
      @from = Date.new(desde[:year].to_i,desde[:month].to_i,desde[:day].to_i)
      @to = Date.new(hasta[:year].to_i, hasta[:month].to_i, hasta[:day].to_i)
      @band_data = BandDatum.where(:user_id=>current_user.id,:date_sent=> @from.beginning_of_day..@to.end_of_day)
    end
    @vars= [@band_data,@from,@to]
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
