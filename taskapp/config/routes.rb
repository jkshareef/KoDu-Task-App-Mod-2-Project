Rails.application.routes.draw do
  resources :comments
  resources :suggestions
  resources :tasks
  resources :relationships
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
