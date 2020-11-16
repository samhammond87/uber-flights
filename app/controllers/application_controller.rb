class ApplicationController < ActionController::Base
    before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?
    # skip_before_action :verify_authenticity_token
    
    include CurrentOrder
    before_action :set_order
    
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :city, :aviator, :license, :experience])
    end

end
