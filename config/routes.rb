Rails.application.routes.draw do
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get "homes/about"=>"homes#about"
  resources :items do
   resource :favorites, only: [:create, :destroy]
   resources :comments, only: [:create, :destroy]
   resource :bookmarks, only: [:create, :destroy]
  end
  # ブックマークのcreateアクションとdestroyアクション
  
  resources :users, only: [:show, :edit, :update] do
    resources :bookmarks, only: [:index]
  end
  end
  