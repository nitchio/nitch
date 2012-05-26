class NitchController < ApplicationController
  before_filter :set_and_load_nitch
  before_filter :verify_nitch_privacy

  def home
  end

  def join
    if current_user
      # Attempt to join this nitch
      # current_nitch.add_user(current_user)
      
    else
      # Present signup form
    end
  end
end
