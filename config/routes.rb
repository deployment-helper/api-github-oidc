Rails.application.routes.draw do
  get 'github/token'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'health#under_development'

  get '/health/', to: 'health#index'
  get '/github/token', to: 'github#token'
  post '/github/token', to: 'github#token'
  get '/github/userinfo', to: 'github#userinfo'
  post '/github/userinfo', to: 'github#userinfo'
  get '/github/login-url', to: 'github#login_url'
  get '/jwks', to: 'github#jwks'
  post '/jwks', to: 'github#jwks'

end
