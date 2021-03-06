class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]  

  # GET /users
  # GET /users.json
  def index
    #@users = User.all
    if current_user && current_user.role == 'Admin'
      if params[:c]
        @users = User.where("name LIKE '%#{params[:c]}%'").select("distinct users.* ")
      else
        q = params[:q] ? "name LIKE '%#{params[:q]}%'" : ""
        @users = User.where(q).order(:created_at).reverse
      end
    else
      redirect_to '/'
    end
  end


  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  #def search  
   # @users = User.where("name like ?", "%#{params[:name]}%")
   # render 'index'
  #end

  # POST /users
  # POST /users.json
  def create

    @user = User.new(user_params)
    @user.role = 'client'

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path flash[:success] = "User was successfully created"}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = current_user
    @user.role = 'client'
    
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, flash[:success] => "User was successfully updated" }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url flash[:success] = "User was successfully destroyed" }
      format.json { head :no_content }
    end
  end

  def disable_user()
    @user = User.find(params[:id])
    type = params[:active]
    if type == '1'
      @user.active = true
    else
      @user.active = false
    end
    @user.save!
    redirect_to users_url
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :lastname, :sex, :weight, :height, :birthdate, :role, :active, :email, :password, :password_comfirmation)
    end
end
