Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "auth", controllers: {
    registrations: "overrides/registrations"
  }
  resources :producers, only: [:index, :create, :destroy]
  resources :actors, only: [:index, :create, :destroy]
  resources :genres, only: [:index, :create, :destroy, :update]
  resources :directors, only: [:index, :create, :destroy]
  resources :films, only: [:index, :create, :destroy]
  resources :films do
    resources :reviews, only: [:index, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
