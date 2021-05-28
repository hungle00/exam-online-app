class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?	
	
  def require_admin
		if !current_user.is_admin
      flash[:danger] = "You must be logged in as admin to perform that action"
      redirect_to root_path
		end
	end

  def after_sign_in_path_for(resource)
    profile_path(current_user)
  end

  protected	

  def configure_permitted_parameters    
    new_attrs = [:username, :email, :password, :password_confirmation, :remember_me] 
    update_attrs = [:username, :email, :password, :password_confirmation, :avatar, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: new_attrs            
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs    
  end
end
