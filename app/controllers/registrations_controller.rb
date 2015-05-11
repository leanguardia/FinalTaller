class RegistrationsController < Devise::RegistrationsController


  def create
    build_resource(sign_up_params)
    resource.save
    redirect_to '/bands/new'
  end
    
  private

	def sign_up_params
		params.require(:user).permit(:name, :lastname, :sex, :weight, :height, :birthdate, :rol, :active, :email, :password, :password_confirmation)
  	end

	def account_update_params
    	params.require(:user).permit(:name, :lastname, :sex, :weight, :height, :birthdate, :rol, :active, :email, :password, :password_confirmation, :current_password)
  	end

  	
end
