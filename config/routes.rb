Rails.application.routes.draw do

  get '/dashboard' => 'admin#dashboard'
  get '/jobs' => 'jobs#index'

  resources :companies, only: [:show, :index]
  resources :people, only: [:show, :index]

  root to: 'jobs#dashboard'
  get "login", to: "session#login"
  get "logout", to: "session#logout"
end
