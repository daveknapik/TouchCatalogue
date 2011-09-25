class MakeLimitsLonger < ActiveRecord::Migration
  def self.up
    change_column :artists, :name, :string, :limit => 1000
    change_column :releases, :title, :string, :limit => 1000
    change_column :releases, :release_url, :string, :limit => 1000
  end

  def self.down
  end
end
