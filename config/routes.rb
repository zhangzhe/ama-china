Rails.application.routes.draw do
  devise_for :mentors
  devise_for :admins
  root 'welcome#index'
  resources :ama_mentors, only: [:new, :create, :index, :show]
  # resources :amas_topics
end
