class Site < ActiveRecord::Base
  attr_accessible :background_img, :base_url, :logo_img, :name, :search_string, :user_id
  
  has_many :games
  belongs_to :user
  
  validates :name, :presence => true, :uniqueness => true
  validates :base_url, :presence => true

  include ActionView::Helpers::TextHelper

  # Constant hash of site-specific css selectors to be used for retrieving
  # guide data from Nokogiri results
  CSS_SELECTORS = {
    "IGN"       => "#search-page #search-list .search-item-title a",
    "GameSpot"  => "ul#js-sort-filter-results.editorial.river.search-results li a",
    "GiantBomb" => "ul#js-sort-filter-results.editorial.river.search-results li a"
  }
  
  # Public: Retrieve hash of game titles and guide links for the game site. 
  # This is an intermediary method calling the Nokogiri search method.  
  # Currently, it only passes data along but may perform other functions in the 
  # future
  #
  # game_title - The String of the game title for which to search
  #
  # Returns a hash containing an Array of titles and url links found on the 
  # game site
  def guideLinksHash(game_title)
    return nokogiriGetGuideLinksWithTitles(game_title)
  end

  # Public: Uses Nokogiri to scrape game sites for link titles and urls of game
  # guide information
  #
  # game_title - The String of the game title for which to search
  #
  # Returns a hash containing an Array of titles and url links found on the 
  # game site
  def nokogiriGetGuideLinksWithTitles(game_title)
    # Setup
    link_titles = []
#    game = Game.new(title: game_title.titleize)
    game = Game.find_or_initialize_by_title_and_site_id(game_title.titleize, self.id)
    
    # Look up Nokogiri info for this site
    query = URI.escape(game_title + " guide")         
    search_query_str = "http://" + base_url + search_string + query
    
    doc = Nokogiri::HTML(open(search_query_str))
    results = doc.css(CSS_SELECTORS[name])
    
    # Iterate through all the search results finding the title and url for each 
    # guide link found on the site  
    results.each do |r|
      link_titles << strip_tags(look_up_title(r))
      game.guide_links << look_up_link(r)
    end
            
    # Store new game data for site_id
    self.games << game 
    
    # Return hash of resultant arrays of link titles & link url's for display
    return {"titles"=>link_titles, "links"=>game.guide_links}

  end

  # Public: Finds the game title within a singular Nokogiri search result
  #
  # result - The HTML structure of one specific guide link search result 
  #
  # Returns the extracted game title from a search result using site-specific 
  # DOM structure location  
  def look_up_title(result)
    case name
    when "IGN"
      return result.children.to_s.strip
    when "GameSpot"
      if result.children.count > 1
        return result.children[1].children[1].children[1].attributes["alt"].value.strip 
      end
    when "GiantBomb"  
      if result.children.count > 1
        return result.children[1].children[1].attributes["alt"].value.strip
      end
    end
  end

  # Public: Finds the url of the game guide link within a singular Nokogiri 
  # search result
  #
  # result - The HTML structure of one specific guide link search result 
  #
  # Returns the extracted url from a search result using site-specific 
  # DOM structure location  
  def look_up_link(result)
    case name
    when "IGN" then return result.attributes["href"].value
    when "GameSpot" then return "http://" + base_url + result.attributes["href"].value
    when "GiantBomb" then return "http://" + base_url + result.attributes["href"].value
    end
  end
  
end
