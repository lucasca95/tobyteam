Rails.application.routes.draw do
	
  get 'main/default'
  root :to => 'main#default'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
