class Nitch::PostsController < Nitch::BaseController
  layout 'nitch'
  before_filter :load_archive
  before_filter :require_user, only: [:new, :create]

  def show
    @post = @archive.posts.where(key: params[:key], slug: params[:slug]).first

    unless @post
      redirect_to archive_url(@archive.key, @archive.slug)
    end
  end

  def new
  end
  
  def create
    @post = Post.new(params[:post])

    @post.nitch = current_nitch
    @post.user  = current_user
    @post.archive = @archive

    if @post.save
      redirect_to post_url(archive_key: @archive.key, archive_slug: @archive.slug, key: @post.key, slug: @post.slug)
    else
      render :new
    end
  end

  protected
  def load_archive
    if params[:archive_id]
      @archive = current_nitch.archives.find(params[:archive_id])
    else
      @archive = current_nitch.archives.where(key: params[:archive_key], slug: params[:archive_slug]).first
    end

    archive_not_found unless @archive
  end
end
