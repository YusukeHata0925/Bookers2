Rails.application.routes.draw do

  root 'top#index'
  # get 'posts/new'
  devise_for :users, controllers: {
  	registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  # resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  resource :favorites, only: [:create, :destroy] do
  resource :post_comments, only: [:new, :create, :index, :show, :destroy]

  end
  resources :users, only: [:show, :edit, :update]
end
