Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "start", to: "quiz#start"
  get "result", to: "quiz#result"
  get "sos", to: "pages#sos"
  resources :resources, only: [:index, :show]
  resources :answers, only: [:show, :create]
  resources :user_activities, only: [:edit, :update]
  resources :questions, only: [:show]
  resources :therapists, only: [:index, :show, :new, :create :edit, :update]
end
