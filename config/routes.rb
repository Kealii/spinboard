Rails.application.routes.draw do
  root 'welcome#index'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  resources :links, only: [:index, :create, :edit, :update] do
    member do
      patch '/change_status', to: 'links#change_status'
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
