module Nitch::ArchivesHelper
  def archive_breadcrumb(archive = nil, post = nil, comment = nil)
    render partial: 'nitch/archives/breadcrumb', locals: { archive: archive, post: post, comment: comment }
  end

  def render_archive(archive, options = {})
    render partial: 'nitch/archives/archive', object: archive, locals: { options: options }
  end
end
