Rails.application.routes.draw do
  root "home#top"
  get 'signup',to: "users#new"
  resources :users,only: [:show,:edit,:create,:destroy,:update]
  resources :posts
  post "login",to: "sessions#create"
  post "logout",to: "sessions#destroy"
  get "login" ,to: "sessions#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
