Rails.application.routes.draw do

  root 'top#index'
  get 'users/:id/edit' => 'users#edit', as: 'edit_user'
  patch 'users/:id' => 'users#update', as: 'update_user'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :update, :destroy]
  # resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  resource :favorites, only: [:create, :destroy] do
  resource :post_comments, only: [:new, :create, :index, :show, :destroy]

  end
  resources :users, only: [:index, :show, :edit, :update]
end
