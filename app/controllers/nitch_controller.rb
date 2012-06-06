class NitchController < Nitch::BaseController
  before_filter :verify_nitch_privacy, except: :private

  def index
    # unless logged_in?
    #   redirect_to join_nitch_path
    # end
  end
end
