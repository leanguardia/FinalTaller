class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user.active == true
      session[:user_id] = user.id
      flash[:success] = "Logged on succesfully"
      #redirect_to_target_or_default root_url, :notice => "Sesion Iniciada Correctamente."
      redirect_to '/bands/new'
    else
      if user.active == false
        flash[:danger] = "Login or password invalid "
      else
        flash[:danger] = "Your acount has been bloqued"
      end
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = "Your session has been closed"
    redirect_to root_url
  end
end
