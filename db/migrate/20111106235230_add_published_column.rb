class AddPublishedColumn < ActiveRecord::Migration
  def change
    add_column :releases, :published, :boolean, :default => true
  end
end
