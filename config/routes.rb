Rails.application.routes.draw do
  devise_for :mentors
  devise_for :admins
  root 'welcome#index'
  # resources :amas_persons
  # resources :amas_topics
end
