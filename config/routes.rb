Rails.application.routes.draw do
  get '/dashboard' => 'jobs#dashboard'
  get '/jobs' => 'jobs#index'

  resources :companies, only: [:show, :index]

  root to: 'jobs#dashboard'
  get "login", to: "session#login"
  get "logout", to: "session#logout"
end
