Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :surf_spots do 
    get "favorite", to: "favorite_spots#favorite"
  end
  get "profile", to: "dashboard#profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
