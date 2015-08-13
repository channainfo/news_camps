module Authenticable
  extend ActiveSupport::Concern

  included do
    before_action :remember_location
    before_action :authenticate_user!
    helper_method :current_user, :user_signed_in?

  end

  def remember_location
    if request.get? && !request.xhr? && !no_auth_path.include?(request.path)
      session[:remember_location] = request.fullpath
    end
  end

  def no_auth_path
    ['/sign_in', '/sign_up', "/"]
  end

  def current_user
    @current_user ||= User.find_by(auth_token: cookies.signed[auth_cookie_name])
  end

  def authenticate_user!
    raise AuthenticationError unless user_signed_in?
  end

  def after_signed_in_path_for(user)
    session[:remember_location] || root_path
  end

  def after_signed_out_path_for(user)
    root_path
  end

  def user_signed_in?
    current_user
  end

  def sign_in(user)
    if params[:remember_me]
      cookies.signed.permanent[auth_cookie_name] = user.auth_token
    else
      cookies.signed[auth_cookie_name] = user.auth_token
    end
  end

  def sign_out
    cookies.delete(auth_cookie_name)
  end

  def sign_in_and_redirect_for(user)
    sign_in(user)
    after_signed_in_path_for(user)
  end

  def sign_out_and_redirect_for(user)
    sign_out
    after_signed_out_path_for(user)
  end

  def auth_cookie_name
    :'_r_'
  end


end