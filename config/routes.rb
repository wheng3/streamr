Rails.application.routes.draw do
  get 'home/show'

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get "/login", to: redirect("/auth/google_oauth2")
	get "/auth/google_oauth2/callback", to: "sessions#create"
	get "/logout", to: "sessions#destroy"
	get '/auth/failure', to: redirect('/')

	resource :session, only: [:create, :destroy]

	root to: "home#show"
end
