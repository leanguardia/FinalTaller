class BandTypesController < ApplicationController
  before_action :set_band_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @band_types = BandType.all
    respond_with(@band_types)
  end

  def show
    respond_with(@band_type)
  end

  def new
    @band_type = BandType.new
    respond_with(@band_type)
  end

  def edit
  end

  def create
    @band_type = BandType.new(band_type_params)
    @band_type.save
    respond_with(@band_type)
  end

  def update
    @band_type.update(band_type_params)
    respond_with(@band_type)
  end

  def destroy
    @band_type.destroy
    respond_with(@band_type)
  end

  private
    def set_band_type
      @band_type = BandType.find(params[:id])
    end

    def band_type_params
      params.require(:band_type).permit(:model)
    end
end
