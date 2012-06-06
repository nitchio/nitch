class UserSessionsController < ApplicationController
  before_filter :load_nitch
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    if @user_session.save
      flash[:notice] = "Login successful!"

      redirect_back_or_default @nitch ? nitch_url(subdomain: @nitch.name) : dashboard_url
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy

    flash[:notice] = "Logout successful!"

    redirect_back_or_default dashboard_url
  end

  private
  def load_nitch
    @nitch = params[:nitch_name] ? Nitch.find_by_name(params.delete(:nitch_name)) : nil
  end
end
