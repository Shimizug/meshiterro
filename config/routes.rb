Rails.application.routes.draw do
  devise_for :users
  get 'homes/top'
  get 'homes/about', as: 'about'
  root to: 'homes#top'
  resources:post_images, only: [:new, :create, :show, :index, :destroy]
  resources:users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
