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
  get '/error_no_se_pudo_guardar', to: 'main#no_se_pudo_guardar'
  post 'users/actualizar_nivel', to: 'users#actualizar_nivel'
  post 'questions/set_best', to: 'questions#set_best'
  root :to => 'questions#index'
end
