Rails.application.routes.draw do

  root to: "games#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "mypage", to: "mypage#index"
  resources :games, only: [:index, :show, :new, :create]
  get "check/:id", to: "games#check", as: "check"
  get "fin/:id", to: "games#fin", as: "fin"
  resources :users, only: [:index, :show]
end
