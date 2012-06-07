module Nitch::CommentsHelper
  def comment_margin(comment)
    comment.depth * 25
  end

  def comment_border(comment)
    if comment.depth.zero?
      'none'
    else
      '1px dotted #DDD'
    end
  end
end
