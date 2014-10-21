Rails.application.routes.draw do

  root 'home#index'

  resources :images do
   get 'rescue', on: :collection
   resources :comments
  end

  get "pages/about"

  devise_for :users
end
