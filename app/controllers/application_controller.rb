class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller? 
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:password, :email])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, 
    	:password_confirmation,:current_password, :username ])
  end

  def after_sign_in_path_for(resource) 
  	feed_posts_path
	end
end