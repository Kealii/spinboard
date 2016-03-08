Rails.application.routes.draw do
  root 'welcome#index'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  resources :links, only: [:index, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
