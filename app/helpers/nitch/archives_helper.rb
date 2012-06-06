module Nitch::ArchivesHelper
  def archive_breadcrumb(user = nil, archive = nil)
    render partial: 'nitch/archives/breadcrumb', locals: { user: user, archive: archive }
  end
end
