class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
   protected

  def configure_permitted_parameters
  	update_attrs = [:name,:lastname,:university_id,:password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:lastname,:university_id, :level_id, :points])
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end
end
