Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/index'
  get 'posts/edit'
  get 'posts/show'
  get 'sessions/new'
  get 'users/index'
  get 'users/edit'
  get 'users/new'
  get 'users/show'
  get('/',{to: "posts#index", as: :home})

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :users

  resources :sessions, only: [:new, :destroy, :create]
   
  root "posts#index"
end
