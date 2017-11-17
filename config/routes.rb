Rails.application.routes.draw do
  

  devise_for :users

  resources :actions
  resources :labels
  resources :comments
  resources :answers
  resources :questions
  resources :reports
  resources :votes
  resources :notifications
  resources :levels
  resources :universities
  resources :users
  resources :oxigens
  get '/error', to: 'main#error'
  get '/error_no_permisos', to: 'main#sin_permiso'
  root :to => 'questions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
