class ApplicationController < ActionController::Base
  respond_to :html, :json
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json'}
  before_filter :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,
                                                         :last_name,
                                                         :email,
                                                         :password,
                                                         :address,
                                                         :phone,
                                                         :birth_date])
    end

    def allow_only_admin
      if current_user.is_admin?
        return
      else
        flash[:error] = "You don't have enough privileges."
        redirect_to root_path
      end
    end
end
