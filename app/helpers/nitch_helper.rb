module NitchHelper
  def join_nitch_button(nitch)
    case nitch.privacy
    when 'public'
      link_to "Join #{current_nitch.title}", join_nitch_path, class: 'btn btn-primary btn-large'
    when 'invite'
      link_to "Request an Invite", join_nitch_path, class: 'btn btn-primary btn-large'
    else
      link_to "Private", '#', class: 'btn btn-info btn-large disabled'
    end
  end
end
