Rails.application.routes.draw do

  root to: 'tasks#index'

  devise_for :user
  resources :projects
  resources :tasks do
    put :complete, on: :member
  end

end
