class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      if user.active
        session[:user_id] = user.id
        flash[:success] = "Logged on successfully"
        #redirect_to_target_or_default root_url, :notice => "Sesion Iniciada Correctamente."
      else
          flash[:danger] = "Your account has been blocked"
          render :action => 'new'
      end
    else
      flash[:danger] = "Wrong username or password"
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = "Your session has been closed"
    redirect_to root_url
  end
end
