class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?


  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      p(p(username) == p(ENV['FURIMA_NAME'])) && p(p(password) == p(ENV['FURIMA_PASS']))
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:])
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:])
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:])
  end
end
