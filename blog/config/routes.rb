Rails.application.routes.draw do 
  
  resources :categories
  devise_for :users, controllers: {
		omniauth_callbacks: 'users/omniauth_callbacks'
	}
  resources :articles do 
  	resources :comments, only: [:create, :destroy, :update]
  end 
=begin
	get "/articles" index
	post "/articles" create
	delete "/articles/:id" destroy
	get "/articles/:id" show
	get "/articles/new" new
	get "/articles/:id/edit" edit
	patch "/articles/:id" update
	put "/articles/:id" update
=end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get "/dashboard", to: "welcome#dashboard"
	get "/report", to: "welcome#report"


	put "/articles/:id/publish", to: "articles#publish"
	devise_scope :user do
		post '/sign_up_validation', to: 'users/omniauth_callbacks#sign_up_validation'
	end
end
