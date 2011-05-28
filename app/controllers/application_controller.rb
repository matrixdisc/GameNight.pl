class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  before_filter :check_login

  private

  def check_login
    if not current_user_session then
      session[:redirect_after_login] = request.path
      redirect_to :login
    end
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  def current_user
     return @current_user if defined?(@current_user)
     @current_user = current_user_session && current_user_session.record
   end
 end
