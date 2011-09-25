class AddPublisherToReleases < ActiveRecord::Migration
  def self.up
    add_column :releases, :publisher, :string
  end

  def self.down
    remove_column :releases, :publisher
  end
end
