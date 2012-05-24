class NitchController < ApplicationController
  def home
    if current_nitch.accessible?(current_user)
      render :home
    else
      
    end
  end
end
