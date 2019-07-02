Rails.application.routes.draw do
  root "home#top"
  get 'signup',to: "users#new"
  get 'login', to: "users#login_form"
  post 'login',to:"users#login"
  resources :users,only: [:show,:edit,:create,:destroy,:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
