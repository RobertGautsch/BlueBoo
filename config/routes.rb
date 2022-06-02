Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "quiz", to: "quiz#start"
  resources :resources, only: [:index, :show]
  resources :suggestions, only: [:index]
  resources :user_activities, only: [:edit, :update]
  resources :questions, only: [:show]
end
