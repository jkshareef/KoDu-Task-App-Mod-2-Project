Rails.application.routes.draw do

  get 'sessions/new'
  resources :requests
  resources :comments
  resources :suggestions
  resources :tasks
  resources :relationships
  resources :users

  get '/', to: 'users#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/friends', to: 'user#friends'
  get '/received', to: 'requests#received'
  get '/sent', to: 'requests#sent'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
