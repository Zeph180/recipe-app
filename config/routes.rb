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
  end
  root "foods#index"

  resources :publics, only: [:index ]

  resources :recipes, except: :update do
    resources :recipe_foods, only: [:create, :destroy, :edit, :new, :update]
  end

  get 'shop_lists', to: "recipes#shop_lists"

end
