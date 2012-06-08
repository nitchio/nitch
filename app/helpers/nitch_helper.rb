module NitchHelper
  def activity_feed_items
    [current_nitch.archives, current_nitch.posts].flatten.compact.sort_by(&:created_at).reverse
  end

  def render_activity_feed_item(item)
    case item
    when Archive
      render_archive item, link: true
    when Post
      render_post item
    when Comment
      # render_comment item, archive: item.archive, post: item.post, parent: item.parent
    end
  end
end
