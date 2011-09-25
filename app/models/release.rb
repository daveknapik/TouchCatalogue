class Release < ActiveRecord::Base
  belongs_to :artist
  
  def artist_name
    artist.name if artist
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name) unless name.blank?
  end
end
