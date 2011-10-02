class ReleaseSweeper < ActionController::Caching::Sweeper
  observe Release
 
  def after_create(release)
    expire_cache_for(release)
  end
 
  def after_update(release)
    expire_cache_for(release)
  end
 
  def after_destroy(release)
    expire_cache_for(release)
  end
 
  private
  def expire_cache_for(release)
    publishers = Release.select(:publisher).group(:publisher).map(&:publisher)
    
    publishers.each do |publisher|
      [:html,:xml].each do |format|
        expire_page :controller => 'releases', :action => 'list_by_publisher', :publisher => publisher, :format => format
      end
    end
  end
end