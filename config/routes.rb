Rails.application.routes.draw do
  resources :advertisements
  devise_for :users, controllers: {registrations: "users/registrations"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index' 

  namespace :admin do
    resources :users
    resources :ad_statuses, only: [:index, :update]
  end

  namespace :users do
    resources :ad_statuses, only: [:index, :update]
    resources :ad_images, only: :destroy
  end
end
