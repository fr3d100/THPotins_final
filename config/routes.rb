Rails.application.routes.draw do

	root 'gossips#index'

  resources :gossips do 
  	resources :comments
    resources :likes, only: [:new, :create, :destroy]
  end

  resources :users
  
  resources :tags

  resources :cities

  resources :sessions, only: [:new, :create, :destroy]

  resources :teams, only: [:index]

  resources :contacts, only: [:index]

  resources :conversations, only: [:index, :show, :new, :create, :destroy] do
    resources :private_messages
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

