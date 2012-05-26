class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_nitch, :current_user_session, :current_user

  def nitch_not_found
    raise ActionController::RoutingError.new('Nitch Not Found')
  end

  def nitch_inaccessible
    raise ActionController::RoutingError.new('Nitch Inaccessible')
  end

  def page_not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  private
  def set_and_load_nitch
    if request.subdomain.present?
      @current_nitch = Nitch.where(name: request.subdomain.downcase).first || nitch_not_found
    else
      nitch_not_found
    end
  end

  def current_nitch
    return @current_nitch if defined?(@current_nitch)
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def verify_nitch_privacy
    return current_nitch && current_nitch.accessible_by?(current_user)
  end

  def require_user
    unless current_user
      store_location

      flash[:notice] = "You must be logged in to access this page"

      redirect_to new_user_session_url

      return false
    end
  end

  def require_no_user
    if current_user
      store_location

      flash[:notice] = "You must be logged out to access this page"

      redirect_to account_url

      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end
