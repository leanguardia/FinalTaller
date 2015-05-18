class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      flash[:success] = "Logged on"
      #redirect_to_target_or_default root_url, :notice => "Sesion Iniciada Correctamente."
      redirect_to '/bands/new'
    else
      flash[:danger] = "Login or password invalid"
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = "You just closed session"
    redirect_to root_url
  end
end
