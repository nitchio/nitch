module Nitch::CommentsHelper
  def render_comment(comment, options = {})
    render partial: 'nitch/comments/comment', object: comment, locals: { options: options }
  end
end
