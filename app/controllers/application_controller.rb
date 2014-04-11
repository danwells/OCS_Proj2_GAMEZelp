class ApplicationController < ActionController::Base
  protect_from_forgery

  include ActionView::Helpers::TextHelper

  helper_method :nokogiriGetGuideLinksWithTitles
  
  def nokogiriGetGuideLinksWithTitles(site_name, game_title)
    link_titles = []
    game = Game.new(title: game_title.titleize)
    site = Site.find_by_name(site_name)
    
    
    # !!! These cases should be refactored (a lot of duplication right now)
    case site_name
      
    when 'IGN'
      # Specific setup for IGN site
      query = URI.escape(game_title + " guide")
      search_str = "http://" + site.base_url + site.search_string + query
      css_selector = "#search-page #search-list .search-item-title a"
      doc = Nokogiri::HTML(open(search_str))
      results = doc.css(css_selector)
        
      results.each do |r|
        link_titles << strip_tags(r.children.to_s.strip)
        game.guide_links << r.attributes["href"].value
      end
      
    when 'GameSpot'
      # Specific setup for GameSpot site
      query = URI.escape(game_title + " guide")
      search_str = "http://" + site.base_url + site.search_string + query
      css_selector = "ul#js-sort-filter-results.editorial.river.search-results li a"
      doc = Nokogiri::HTML(open(search_str))
      results = doc.css(css_selector)
        
      results.each do |r|
        if (r.children.count > 1)
          link_titles << strip_tags(r.children[1].children[1].children[1].attributes["alt"].value.strip)
          game.guide_links << "http://" + site.base_url + r.attributes["href"].value
        end
      end

    when 'GiantBomb'
      # Specific setup for GiantBomb site
      query = URI.escape(game_title + " guide")
      search_str = "http://" + site.base_url + site.search_string + query
      css_selector = "ul#js-sort-filter-results.editorial.river.search-results li a"
      doc = Nokogiri::HTML(open(search_str))
      results = doc.css(css_selector)
        
      results.each do |r|
        if (r.children.count > 1)
          link_titles << strip_tags(r.children[1].children[1].attributes["alt"].value.strip)
          game.guide_links << "http://" + site.base_url + r.attributes["href"].value
        end
      end

    else
      link_titles << "No Results..."
      game.guide_links << "#{}"
      
    end

    # game.save 
    site.games << game 

    return {"titles"=>link_titles, "links"=>game.guide_links}

  end

end
