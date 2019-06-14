class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods



  def authenticate_user
    authenticate_or_request_with_http_basic do |username, password|
      # you probably want to guard against a wrong username, and encrypt the
      # password but this is the idea.
      @user = User.find_by_email(username)
      Thread.current[:user] = @user
      @user.password == password
    end
  end

end
