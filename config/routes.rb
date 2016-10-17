Rails.application.routes.draw do
  root to: 'admin#dashboard#dashboard'
  get '/dashboard' => 'admin#dashboard'

  get '/jobs' => 'jobs#index'

  resources :companies, only: [:show, :index]
  resources :people, only: [:show, :index]

  get "login", to: "session#login"
  get "logout", to: "session#logout"
end
