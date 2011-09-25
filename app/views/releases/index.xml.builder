xml.releases(:type => "array") do 
  @releases.each do |release|
    xml.release do
      xml.id release.id
      xml.catalogue_number release.catalogue_number
      xml.title release.title
      xml.description release.description
      xml.artist release.artist_name
      xml.cover_art_url release.cover_art_url
      xml.mp3_sample_url release.mp3_sample_url
      xml.release_url release.release_url
      xml.itunes_url release.itunes_url
      xml.release_date release.release_date
      xml.created_at release.created_at
      xml.updated_at release.updated_at
      xml.release_duration release.duration
      xml.track_listing release.track_listing
      xml.publisher release.publisher
    end
  end
end