class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActionController::RoutingError, with: :goto_dashboard

  helper_method :current_user_session, :current_user, :logged_in?

  if Rails.env.production?
    before_filter :basic_auth
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic("Restricted") do |username, password|
      username == 'demo' && password == 'bozeman'
    end
  end

  def goto_dashboard
    redirect_to "http://www.#{Settings.domain_name}/"
  end

  def logged_in?
    current_user
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    unless current_user
      store_location

      flash[:notice] = "You must be logged in to access this page"

      redirect_to login_url

      return false
    end
  end

  def require_no_user
    if current_user
      store_location

      flash[:notice] = "You must be logged out to access this page"

      redirect_to dashboard_url

      return false
    end
  end

  def store_location
    session[:return_to] = request.url
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
