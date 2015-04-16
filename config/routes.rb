Rails.application.routes.draw do
  # get 'purchases/new'

  resources :products do
  	member do
  		# get 'purchases/new', to: 'purchases#new'
  		# post 'purchases', to: 'purchases#create'
  		resources :purchases
  	end
  end
  root "products#index"
end
