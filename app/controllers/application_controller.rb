class ApplicationController < ActionController::Base
  before_action :basic_auth

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      p(p(username) == p(ENV['FURIMA_NAME'])) && p(p(password) == p(ENV['FURIMA_PASS']))
    end
  end
end
