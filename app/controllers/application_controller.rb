class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
<<<<<<< HEAD
  before_action :basic_auth, if: :production?

  private

  def production?
    Rails.env.production?
  end

  #Basic認証を要求するための記述
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username ==  ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
=======
>>>>>>> parent of 4f4041d... add basic auth
end
