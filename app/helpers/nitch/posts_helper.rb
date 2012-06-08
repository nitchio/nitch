module Nitch::PostsHelper
  def render_post(post, options = {})
    render partial: 'nitch/posts/post', object: post, locals: { options: options }
  end
end
