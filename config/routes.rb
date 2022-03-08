Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :surf_spots do
    resources :surf_sessions, only: :create
    resources :spot_reviews, only: [:index, :show, :new, :create]
    get "favorite", to: "favorite_spots#favorite"
  end

  get "profile", to: "dashboard#profile"

  resources :tags, only: [:index, :new, :create] do
    resources :favorite_spot_tags, only: [:new, :create, :destroy] 

  end
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
