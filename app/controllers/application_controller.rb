class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?	
	
  def require_admin
		if !current_user.is_admin
				flash[:danger] = "You must be logged in as admin to perform that action"
				redirect_to root_path
		end
	end

  protected	

  def configure_permitted_parameters    
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]        
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs            
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs  
  end
end
