class Nitch::ArchivesController < Nitch::BaseController
  layout 'nitch'
  before_filter :require_user

  def index
    @user = User.find_by_username(params[:username]) if params[:username]
  end

  def new
    @archive = Archive.new
  end
  
  def create
    @archive = Archive.new(params[:archive])

    @archive.user  = current_user
    @archive.nitch = current_nitch

    if @archive.save
      redirect_to archive_url(username: @archive.username, slug: @archive.slug)
    else
      render :new
    end
  end

  def show
    @archive = current_nitch.archives.where(username: params[:username], slug: params[:slug]).first

    unless @archive
      redirect_to nitch_url
    end
  end
end
