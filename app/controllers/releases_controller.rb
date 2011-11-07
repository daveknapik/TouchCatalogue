class ReleasesController < ApplicationController
  before_filter :login_required, :except => [:index, :show, :list_by_publisher]
  caches_page :list_by_publisher
  cache_sweeper :release_sweeper, :only => [:create, :update, :destroy]
  
  def index
    @releases = Release.includes(:artist).order("release_date DESC")
    
    respond_to do |format| 
      format.html 
      format.xml do 
        @releases = Release.includes(:artist).where(:published => true).order("release_date DESC")
        render :layout => false
      end
    end
  end
  
  def show
    @release = Release.find params[:id]
  end
  
  def new
    @release = Release.new
    @artists = Artist.all
  end
  
  def create
    @release = Release.new params[:release]
    
    if @release.save!
      flash[:notice] = "#{@release.title} saved."
      redirect_to :action => "index"
    else
      render :new
    end
  end
  
  def edit
    @release = Release.find params[:id]
    @artists = Artist.all
  end
  
  def update
    @release = Release.find params[:id]
    
    if (@release.update_attributes(params[:release]))
      flash[:notice] = "#{@release.title} saved."
      redirect_to :action => "index"
    else
      render :edit
    end
  end
  
  def destroy
    release = Release.find params[:id]
    release.destroy
    flash[:notice] = "#{release.title} deleted."
    redirect_to :action => "index"
  end
  
  #Custom XML feed methods based on release's publisher
  def list_by_publisher
    @publisher = params[:publisher].gsub("-"," ")
    
    if (@publisher == "all")
      @releases = Release.find(:all, :order => "release_date DESC")
    else
      @releases = Release.find(:all, :conditions => ["publisher = ?", @publisher], :order => "release_date DESC")
    end
    
    respond_to do |format| 
      format.html {render :template => "releases/index"}
      format.xml {render :template => "releases/index", :layout => false} 
    end
  end
  
  def search  
    if params[:search].blank?
      @releases = Release.includes(:artist).order("release_date DESC")
    else
      @releases = Release.includes(:artist).joins(:artist).where("lower(releases.title) LIKE ? OR lower(artists.name) LIKE ?","%#{params[:search].downcase}%","%#{params[:search].downcase}%").order("releases.release_date DESC")
    end
    
    unless params[:publisher].blank? || params[:publisher] == "all"
      @releases = @releases.where(:publisher => params[:publisher])
    end
    
    respond_to do |format| 
      format.json {render :partial => "release", :collection => @releases} 
    end
  end
  
  private
    def login_required
      unless current_admin
        flash[:error] = 'Only logged in admins an access this page.'
        redirect_to releases_path
      end
    end
  
end
