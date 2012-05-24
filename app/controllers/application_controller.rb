class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_and_load_nitch

  def current_nitch
    return @current_nitch if defined?(@current_nitch)
  end

  def nitch_not_found
    raise ActionController::RoutingError.new('Nitch Not Found')
  end

  def nitch_inaccessible
    raise ActionController::RoutingError.new('Nitch Inaccessible')
  end

  def page_not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  protected
  def set_and_load_nitch
    if request.subdomain.present?
      @current_nitch = Nitch.where(name: request.subdomain.downcase).first || nitch_not_found
    else
      nitch_not_found
    end
  end
end
