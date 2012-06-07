module Nitch::PostsHelper
  def render_comment(comment)
    render partial: 'nitch/comments/comment', object: comment
  end
end
