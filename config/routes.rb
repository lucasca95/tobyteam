Rails.application.routes.draw do
  resources:inicio
  root :to => 'inicio#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
