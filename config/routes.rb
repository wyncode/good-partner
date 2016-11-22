Rails.application.routes.draw do
  root to: 'admin#dashboard#dashboard'
  get '/dashboard' => 'admin#dashboard'

  resources :jobs, only: [:show, :index]

  resources :companies, only: [:show, :index]

  post '/people/search' => 'people#search'
  resources :people, only: [:show, :index]

  get "login", to: "session#login"
  get "logout", to: "session#logout"
end
