class Nitch::CommentsController < Nitch::BaseController
  layout 'nitch'
  before_filter :load_post_and_archive
  before_filter :require_user, only: [:new, :create]

  def show
    @comment = @post.comments.where(key: params[:key]).first

    unless @comment
      redirect_to post_url(@post.key, @post.slug)
    end
  end

  def new
  end
  
  def create
    @comment = Comment.new(params[:comment])

    @comment.nitch = current_nitch
    @comment.user  = current_user
    @comment.archive = @archive
    @comment.post = @post

    if @comment.save
      redirect_to post_url(archive_key: @archive.key, archive_slug: @archive.slug, key: @post.key, slug: @post.slug)
    else
      render :new
    end
  end

  protected
  def load_post_and_archive
    @archive = current_nitch.archives.where(key: params[:archive_key], slug: params[:archive_slug]).first
    return archive_not_found unless @archive

    @post = @archive.posts.where(key: params[:post_key], slug: params[:post_slug]).first
    return post_not_found unless @post
  end
end
