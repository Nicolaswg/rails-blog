Rails.application.routes.draw do
	root 'user#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

	resources :user, only: [:index, :show]
  # Defines the root path route ("/")
  # root "articles#index"
end
