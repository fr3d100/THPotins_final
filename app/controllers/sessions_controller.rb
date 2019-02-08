class SessionsController < ApplicationController

	def create
		
		user = User.find_by(email: params['email'])

		if user && user.authenticate(params['password'])
			session[:user_id]= user.id
			flash[:success] = "Bienvenue, #{user.first_name}"
			redirect_to gossips_path
		else
			flash[:danger] = "Oups, nous n'avons pas réussi à vous identifier"
			render 'new'
		end

	end


  def destroy
    session.delete(:user_id)
    flash[:primary] = "Vous avez été deconnecté"
    redirect_to new_session_path
  end


end
