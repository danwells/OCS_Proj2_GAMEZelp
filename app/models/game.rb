class Game < ActiveRecord::Base
  attr_accessible :cover_img, :platform, :site_id, :title, :year
  serialize :guide_links, Array
  
  belongs_to :site
  
  validates :title, :presence => true
  
end
