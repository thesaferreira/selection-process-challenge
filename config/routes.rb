Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  devise_for :users, only: %i[ sessions registrations passwords ]
end
