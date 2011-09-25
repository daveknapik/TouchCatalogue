class Artist < ActiveRecord::Base
  has_many :releases, :dependent => :delete_all
end
