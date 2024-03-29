Rails.application.routes.draw do
  resources :comments, only: [:destroy]
  post "comments/:post_id" ,to: "comments#create"
  resources :favorites, only: [:destroy]
  post "favorites/:id" ,to: "favorites#create"
  root "home#top"
  get 'signup',to: "users#new"
  resources :users,only: [:show,:edit,:create,:destroy,:update]
  get "users/likes/:id" , to: "users#like", as: :user_likes
  get "users/comments/:id",to: "users#comment", as:  :user_comments
  
  post "comments/like/:comment_id", to: "comments#like", as: :like_comment
  delete "comments/unlike/:comment_id", to: "comments#unlike", as: :unlike_comment
  
  get "users/comments/likes/:id", to: "users#like_comment", as: :user_likes_comment
  resources :posts
  post "login",to: "sessions#create"
  post "logout",to: "sessions#destroy"
  get "login" ,to: "sessions#new"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
