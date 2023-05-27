Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get "homes/about"=>"homes#about"
  resources :items do
   resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  end
  