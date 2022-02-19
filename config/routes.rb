Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :surf_spots
  get "profile", to: "dashboard#profile"
  get "favorite", to: "favorite_spot#favorite"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
