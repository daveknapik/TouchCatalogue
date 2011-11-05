Factory.define :release, :class => Release do |r|
  r.catalogue_number "TO:66"
  r.title "Awesome Drone"
  r.duration "59:22"
  r.track_listing "1. Drone 1\n2. Drone 2"
  r.release_date "2011-10-12"
  r.cover_art_url "http://www.touchmusic.org.uk/images/585x/TO70DS.jpg"
  r.release_url "http://www.touchmusic.org.uk/catalogue/to70ds_hildur_gudnadottir_irides.html"
  r.itunes_url "http://touchshop.org/product_info.php?cPath=87&products_id=377"
  r.mp3_sample_url "http://www.touchshop.org/media/iri.mp3"
  r.description "Mixed and mastered by BJNilsen, Berlin, February 2009. Image by Jon Wozencroft.\r\n\r\nBoomkat (UK):\r\n\r\nAn addendum to her exquisite Without Sinking album, 'Iridescence' is a wonderful eleven minute blast of Hildur Gudnadottir's uniquely emotive music for cello and electronics. The piece gradually creeps further and further into the electronic domain, beginning in a haze of minor-key, multitracked strings, only to dissolve into the air as a bitcrushing algorithm takes hold. By the piece's conclusion, the overwhelming, gushing melancholy of it all is displaced by a strangely mechanical network of overtones and harmonic spillage, making 'Iridescence' all the more elegiac. Brilliant.\r\n\r\nListening track: extract\r\n"
  r.reviews "So awesome!"
  r.publisher "Touch"
  r.association :artist
end