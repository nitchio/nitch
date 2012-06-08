class Nitch::BaseController < ApplicationController
  before_filter :set_and_load_nitch

  helper_method :current_nitch

  private
  def nitch_not_found
    raise ActionController::RoutingError.new('Nitch Not Found')
  end

  def archive_not_found
    raise ActionController::RoutingError.new('Archive Not Found')
  end

  def post_not_found
    raise ActionController::RoutingError.new('Comment Not Found')
  end

  def comment_not_found
    raise ActionController::RoutingError.new('Comment Not Found')
  end

  def nitch_inaccessible
    raise ActionController::RoutingError.new('Nitch Inaccessible')
  end

  def page_not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def current_nitch
    return @current_nitch if defined?(@current_nitch)
  end

  def set_and_load_nitch
    if request.subdomain.present? && request.subdomain == 'www'
      goto_dashboard
    elsif request.subdomain.present?
      @current_nitch = Nitch.where(name: request.subdomain.downcase).first || goto_dashboard
    else
      goto_dashboard
    end
  end

  def verify_nitch_privacy
    return true
    # unless current_nitch && current_nitch.accessible_by?(current_user)
    #   redirect_to private_nitch_path
    # 
    #   return false
    # end
  end
end
