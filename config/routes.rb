Rails.application.routes.draw do
  root "home#top"
  get 'signup',to: "users#new"
  resources :users,only: [:show,:edit,:create,:destroy,:update]
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
