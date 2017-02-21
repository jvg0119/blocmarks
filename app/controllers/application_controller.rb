class ApplicationController < ActionController::Base
	
	include Pundit
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(request.referrer || root_path)
  # end

  def user_not_authorized(exception)
  	policy_name = exception.policy.class.to_s.underscore

  	flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
  		redirect_to(request.referrer || root_path)
 	end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
