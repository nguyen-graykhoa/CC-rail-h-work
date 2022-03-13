Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/index'
  get 'users/edit'
  get 'users/new'
  get 'users/show'
  resources :users
  resource :sessions, only: [:new, :destroy, :create]
  root "users#index"
end
