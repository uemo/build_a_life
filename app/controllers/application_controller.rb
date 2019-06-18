class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_logs_path(user_id: current_user.id)
  end


  protected

  def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :ruby_name,
    	 :hundle_name, :phone ])
  end
end
