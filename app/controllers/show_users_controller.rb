class ShowUsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def register_band
		redirect_to Band
	end
end
