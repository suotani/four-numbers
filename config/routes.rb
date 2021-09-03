Rails.application.routes.draw do

   #root to: "games#index"
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
   resources :chats, only: [:index, :show]
   get "/teacher", to: "white_boards#teacher"
   get "/student", to: "white_boards#student"
   resources :tweets, only: [:index, :create]

  resources :tasks do
    post :confirm, action: :confirm_new, on: :new
    post :import, on: :collection
  end


  get "/input", to: "calc#input"
  post "/exec", to: "calc#calc"

  resources :taxes
end
