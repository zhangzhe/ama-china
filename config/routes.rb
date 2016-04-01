Rails.application.routes.draw do
  root 'home#index'
  devise_for :mentors
  devise_for :admins

  resources :ama_mentors, except: [:index, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
  resources :ama_topics, except: [:index, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
  resources :ama_uploaders, only: [:index, :create]
end
