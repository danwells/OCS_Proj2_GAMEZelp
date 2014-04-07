class Site < ActiveRecord::Base
  attr_accessible :background_img, :base_url, :logo_img, :name, :search_string, :user_id
  
  has_many :games
  belongs_to :user
  
  validates :name, :presence => true, :uniqueness => true
  validates :base_url, :presence => true
  
end
