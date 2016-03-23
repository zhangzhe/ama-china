Rails.application.routes.draw do
  devise_for :mentors
  devise_for :admins
  root 'home#index'
  resources :ama_mentors, only: [:new, :create, :index, :show]
  # resources :amas_topics
end
