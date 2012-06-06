class UsersController < ApplicationController
  before_filter :load_nitch
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      if @nitch
        # @nitch.add_user(@user)
      end

      redirect_back_or_default @nitch ? nitch_url(subdomain: @nitch.name) : dashboard_url
    else
      render :new
    end
  end

  def show
  end

  def update
  end

  private
  def load_nitch
    @nitch = params[:nitch_name] ? Nitch.find_by_name(params.delete(:nitch_name)) : nil
  end
end
