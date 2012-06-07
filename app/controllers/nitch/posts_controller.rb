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
  end

  protected
  def load_archive
    @archive = current_nitch.archives.where(key: params[:archive_key], slug: params[:archive_slug]).first

    archive_not_found unless @archive
  end
end
