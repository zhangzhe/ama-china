Rails.application.routes.draw do

  devise_for :mentors
  devise_for :admins
  root 'home#index'
  resources :ama_mentors do
    resources :comments
  end
  resources :ama_topics do
    resources :comments
  end

end
