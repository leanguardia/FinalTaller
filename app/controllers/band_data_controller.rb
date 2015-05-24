class BandDataController < ApplicationController
  before_action :set_band_datum, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @band_data = BandDatum.all
    respond_with(@band_data)
  end

  def show
    respond_with(@band_datum)
  end

  def new
    @band_datum = BandDatum.new
    respond_with(@band_datum)
  end

  def edit
  end

  def create
    @band_datum = BandDatum.new(band_datum_params)
    @band_datum.save
    respond_with(@band_datum)
  end

  def update
    @band_datum.update(band_datum_params)
    respond_with(@band_datum)
  end

  def destroy
    @band_datum.destroy
    respond_with(@band_datum)
  end

  private
    def set_band_datum
      @band_datum = BandDatum.find(params[:id])
    end

    def band_datum_params
      params.require(:band_datum).permit(:user_id, :band_id, :steps_taken, :calories_burnt, :hearth_rate_pminute, :longitude, :latitude)
    end
end
