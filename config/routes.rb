Rails.application.routes.draw do

	
	root 'gossips#index'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/welcome/:first_name', to: 'static_pages#welcome'

  resources :gossips do 
  	resources :comments
    resources :likes, only: [:new, :create, :destroy]
  end

  resources :users
  
  resources :tags

  resources :cities

  resources :sessions, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

