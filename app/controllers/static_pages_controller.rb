class StaticPagesController < ApplicationController

  def dashboard
    if current_user
      @band_data = User.find(current_user.id).band_data
    else
      redirect_to '/'
    end
  end

	def home
  end

  def help
 	end
  	
  def about
  end
end
