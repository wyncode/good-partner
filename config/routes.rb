Rails.application.routes.draw do
  root to: 'jobs#index'
  get "login", to: "session#login"
  get "logout", to: "session#logout"
end
