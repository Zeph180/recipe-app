# frozen_string_literal: true

Rails.application.routes.draw do
   devise_for :users, controllers: {
        sessions: 'users/sessions',
        passwords:'users/passwords',
        registrations:'users/registrations',
        confirmations:'users/confirmations',
      }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   
  resources :users, only: [:show] do
    resources :foods, only:[:index,:show,:new,:create, :destroy]
    resources :inventories,only:[:index,:show,:new,:create, :destroy] do
      resources :inventory_foods,only: [:new,:create, :destroy]
    end
  end
  root "foods#index"
end
