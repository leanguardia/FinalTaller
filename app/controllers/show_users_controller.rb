class ShowUsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def index
		#@user = User.all
		@user = User.order('name ASC')
	end

	def register_band
		redirect_to Band
	end
end
