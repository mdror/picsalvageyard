Rails.application.routes.draw do

  #devise_for :users
  root 'user#index'
  resources :images do
    get 'rescue', on: :collection
  end
  resources :comments
  resources :images

end
