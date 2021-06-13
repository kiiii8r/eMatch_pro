Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "users#front"
  get 'users/search' 
  resources :relationships, only: [:create, :destroy]
  resources :users, only: [:index, :show] do
    resources :profiles, only: [:new, :create, :edit, :update]
  end
  resources :notifications, only: [:index, :create, :destroy]
  resources :rooms, only: [:create, :show] do
    resources :messages, only: :create
  end
end