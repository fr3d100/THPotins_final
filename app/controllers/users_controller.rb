class UsersController < ApplicationController

	before_action :authenticate_user, only: [:index]

	def index
		@users = User.all
		@top_user = User.first
		@users.each do |user|
			if user.gossips.size > @top_user.gossips.size
				@top_user = user
			end
		end
	end

	def show
		@user = User.find(params['id'])
	end

	def new
		@cities = City.all
	end

	def create
		puts params
		@user = User.new
		@user.first_name = params['first_name']
		@user.last_name = params['last_name']
		@user.age = params['age']
		@user.email = params['email']
		@user.password = params['password']
		@user.password_confirmation = params['password_confirm']
		@user.city = City.find(params['city'])

		if @user.save
			log_in(@user)
			flash[:success] = "Bravo, votre compte a été créé"
			redirect_to root_path
		else
			puts "Problème lors de la tentative de création de l'utilisateur"
			flash[:danger] = []
      @user.errors.full_messages.each do |message|
        flash[:danger] << message
      end
      flash[:danger] = flash[:danger].join(" & ")

      redirect_to new_user_path

		end

	end

	private 

	def authenticate_user
    unless current_user
      flash[:danger] = "Vous devez vous connecter pour accéder à cet espace"
      redirect_to new_session_path
    end
  end


end
