Rails.application.routes.draw do
  root 'welcome#index'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  resources :links, only: [:index]
end
