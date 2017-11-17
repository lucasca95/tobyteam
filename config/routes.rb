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
  post 'users/votar_pregunta', to: 'users#votar_pregunta'
  post 'users/votar_respuesta', to: 'users#votar_respuesta'
  get '/error_no_permisos', to: 'main#sin_permiso'
  root :to => 'questions#index'
end
