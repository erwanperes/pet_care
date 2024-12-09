class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  helper_method :page_name

  protected
  
  def page_name
    controller_name = controller_path.gsub('/', '_')
    "#{controller_name}_#{action_name}"
  end

  def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address])
	devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address])
  end
  
  def after_sign_in_path_for(resource)
    # Rediriger vers la page des items de l'utilisateur après la connexion
    pets_path(resource)
  end
end