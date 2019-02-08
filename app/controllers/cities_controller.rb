class CitiesController < ApplicationController
	
	before_action :authenticate_user

	def index
		@cities = City.all
		@top_city = City.first
		@cities.each do |city|
			if city.users.size > @top_city.users.size
				@top_city = city
			end
		end
	end

	def show
		@city = City.find(params["id"])
	end
	
	private 

  def authenticate_user
    unless current_user
      flash[:danger] = "Vous devez vous connecter pour accéder à cet espace"
      redirect_to new_session_path
    end
  end


end
