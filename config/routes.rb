Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :tenant_sessions, only: [:new, :create]
  root to: 'posts#index'
end
