class Nitch::ArchivesController < Nitch::BaseController
  layout 'nitch'
  before_filter :require_user, only: [:new, :create]

  def index
    @user = User.find_by_key(params[:key]) if params[:key]
  end

  def show
    @archive = current_nitch.archives.where(key: params[:key], slug: params[:slug]).first

    unless @archive
      redirect_to nitch_url
    end
  end

  def new
    @archive = Archive.new
  end
  
  def create
    @archive = Archive.new(params[:archive])

    @archive.nitch = current_nitch
    @archive.user  = current_user

    if @archive.save
      redirect_to archive_url(key: @archive.key, slug: @archive.slug)
    else
      render :new
    end
  end
end
