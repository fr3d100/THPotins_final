class SessionsController < ApplicationController

	def new
  end
	
	def create
		
    user = User.find_by(email: params[:email])
    
    if user && user.authenticate(params[:password])
      log_in user
      params[:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
		else
			flash[:danger] = "Oups, nous n'avons pas réussi à vous identifier"
			render 'new'
		end

	end


  def destroy
    log_out if logged_in?
    flash[:primary] = "Vous avez été deconnecté"
    redirect_to new_session_path
  end


end
