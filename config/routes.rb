Rails.application.routes.draw do
  devise_for :users
  root to: 'surf_spots#index'

  resources :surf_spots do 
    get "favorite", to: "favorite_spots#favorite" do
      resources :favorite_spot_tags, only: [:new, :create]
    end 
  end

  get "profile", to: "dashboard#profile"

  resources :tags, only: [:index, :new, :create] do
    resources :favorite_spot_tags, only: [:new, :create]
  end
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
