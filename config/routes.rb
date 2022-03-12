Rails.application.routes.draw do
  get 'users/index'
  get 'users/edit'
  get 'users/new'
  get 'users/show'
  resources :users
  root "users#index"
end
