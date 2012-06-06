class DashboardController < ApplicationController
  def index
    # unless logged_in?
      render :welcome
    # end
  end

  def bar
    @nitch = Nitch.find_by_name(params[:nitch_name])

    render layout: false
  end
end
