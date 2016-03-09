Rails.application.routes.draw do
  root 'welcome#index'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  resources :links, only: [:index, :create, :edit, :update] do
    member do
      post '/change_status', to: 'links#change_status'
      get '/recommend', to: 'links#recommend'
      post '/send_email', to: 'links#send_email'
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  namespace :api do
    namespace :v1 do
      resources :links, only: [:index]
    end
  end
end
