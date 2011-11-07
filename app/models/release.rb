class Release < ActiveRecord::Base
  belongs_to :artist
  scope :published, where(:published => true)
  scope :draft, where(:published => false)
  
  def artist_name
    artist.name if artist
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name) unless name.blank?
  end
end
