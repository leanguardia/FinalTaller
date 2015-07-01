class SleepsController < ApplicationController
  before_action :set_sleep, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @sleeps = Sleep.where(user_id:current_user.id).reverse
    respond_with(@sleeps)
  end

  def show
    respond_with(@sleep)
  end

  def new
    @sleep = Sleep.new
    respond_with(@sleep)
  end

  def edit
  end

  def create
    @sleep = Sleep.new(started_at:DateTime.now,user_id:current_user.id)
    @sleep.save
    redirect_to('/sleeps')
  end

  def awake
    @sleep = Sleep.find(params[:id])
    @sleep.awake()
    redirect_to('/sleeps')
  end

  def update
    @sleep.update(sleep_params)
    respond_with(@sleep)
  end

  def destroy
    @sleep.destroy
    respond_with(@sleep)
  end

  private
    def set_sleep
      @sleep = Sleep.find(params[:id])
    end

    def sleep_params
      params.require(:sleep).permit(:started_at, :awaken_at)
    end
end
