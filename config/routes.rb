Rails.application.routes.draw do
	root 'user#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
	# Defines the root path route ("/")
	# root "articles#index"

	resources :user, only: [:index, :show] do
		resources :post, only: [:index, :show, :new, :create] do
			resources :comment, only: [:create]
			resources :like, only: [:create]
		end
	end
end
