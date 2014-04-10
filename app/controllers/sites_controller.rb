require 'open-uri'

class SitesController < ApplicationController

  def index
    # @link_titles = []
    # @game = Game.new
    # @link_urls = []
    @site_results = []
    if params[:gameQuery]
      @ign_hash = nokogiriGetGuideLinksWithTitles('IGN', params[:gameQuery])
      @site_results << @ign_hash
      
      @gamespot_hash = nokogiriGetGuideLinksWithTitles('GameSpot', params[:gameQuery])
      @site_results << @gamespot_hash
      
      
      # Manual setup for IGN site
      # @ign_site = Site.find_by_name('IGN')
      # query = URI.escape(params[:gameQuery])
      # search_str = "http://" + @ign_site.base_url + @ign_site.search_string + query
      #       
      # doc = Nokogiri::HTML(open(search_str))
      # css_selector = "#search-page #search-list .search-item-title a"
      # results = doc.css(css_selector)
      # @game.title = URI.unescape(query).titleize
      # results.each do |r|
      #   @link_titles << r.children.to_s
      #   # @link_urls << r.attributes["href"].value
      #   @game.guide_links << r.attributes["href"].value
      # end 
      # # @game.guide_links << @links_urls
      # # @game.save
      # @ign_site.games << @game 
      #     
    end
    
    @sites = Site.all
  end
  
end
