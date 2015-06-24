class StaticPagesController < ApplicationController

  def dashboard
    if current_user
      @form = Date.today
      @to = Date.today
      if !params[:from]
        @band_data = User.find(current_user.id).band_data
      else
        @from = Date.new(params[:from][:year].to_i,params[:from][:month].to_i,params[:from][:day].to_i)
        @to = Date.new(params[:to][:year].to_i, params[:to][:month].to_i, params[:to][:day].to_i)
        @band_data = BandDatum.where(:user_id=>current_user.id,:date_sent=> @from.beginning_of_day..@to.end_of_day)
        #@band_data = User.find(current_user.id).band_data
      end
      @vars= [@band_data,@from,@to]
    else
      redirect_to '/'
    end
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
