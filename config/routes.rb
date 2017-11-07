Rails.application.routes.draw do
	
	resources :main_controller
	root :to => main_controller#inicio

  get 'main/default'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
