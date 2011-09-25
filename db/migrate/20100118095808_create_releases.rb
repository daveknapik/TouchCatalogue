class CreateReleases < ActiveRecord::Migration
  def self.up
    create_table :releases do |t|
      t.string :catalogue_number
      t.string :title
      t.string :duration
      t.text :track_listing
      t.date :release_date
      t.string :cover_art_url
      t.string :release_url
      t.string :itunes_url
      t.string :mp3_sample_url
      t.text :description
      t.text :reviews

      t.belongs_to :artist

      t.timestamps
    end
  end

  def self.down
    drop_table :releases
  end
end
