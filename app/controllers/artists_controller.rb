class ArtistsController < ApplicationController
  def index
    @artists = Artist.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
    
    respond_to do |format| 
      format.js
      format.html 
      format.xml { render :layout => false, :xml => @artists.to_xml } 
    end
  end
  
  def new
    @artist = Artist.new
  end
  
  def destroy
    artist = Artist.find params[:id]
    artist.destroy
    flash[:notice] = "#{artist.name} deleted."
    redirect_to :action => "index"
  end
  
end
