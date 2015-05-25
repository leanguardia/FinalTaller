class BandsController < ApplicationController
  before_action :set_band, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @bands = Band.where(user_id: current_user.id)
    respond_with(@bands)
  end

  def show
    respond_with(@band)
  end

  def new
    @types = Band.get_types
    @colors = Band.get_color
    @band = Band.new
    respond_with(@band)
  end

  def edit
    @band.user_id = current_user.id
    @types = Band.get_types
    @colors = Band.get_color
    @band = Band.find(params[:id])
    respond_with(@band)
  end

  def create
    @band = Band.new(band_params)
    @band.user_id = current_user.id
    @band.save
    respond_with(@band)
  end

  def update
    @band.update(band_params)
    respond_with(@band)
  end

  def destroy
    @band.destroy
    respond_with(@band)
  end

  private
    def set_band
      @band = Band.find(params[:id])
    end

    def band_params
      params.require(:band).permit(:color, :user_id, :Band_type_id)
    end
end
