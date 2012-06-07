module Nitch::ArchivesHelper
  def archive_breadcrumb(archive = nil, post = nil)
    render partial: 'nitch/archives/breadcrumb', locals: { archive: archive, post: post }
  end

  def render_archive(archive)
    render partial: 'nitch/archives/archive', object: archive
  end

  def render_post(post, body_expanded = false)
    render partial: 'nitch/posts/post', object: post, locals: { body_expanded: body_expanded }
  end
end
