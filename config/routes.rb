Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :users, only: [:edit, :update]
  resources :appointments do
  	member do
  		get :accept_appointment, as: :accept
  	end
  end
end
