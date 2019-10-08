class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :basic_auth

  private

  #Basic認証を要求するための記述
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'weekend56b' && password == '1005b'
    end
  end
end
