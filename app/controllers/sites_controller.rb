require 'open-uri'

class SitesController < ApplicationController

  def index
    
    if (params[:prev_query])
      game_title = params[:prev_query]
    elsif (params[:gameSearch] && params[:gameSearch][:gameQuery])
      game_title = params[:gameSearch][:gameQuery]
    else
      game_title = nil
    end
        
    @site_results = []
    if (game_title)
      @ign_hash = nokogiriGetGuideLinksWithTitles('IGN', game_title)
      @site_results << @ign_hash
      
      @gamespot_hash = nokogiriGetGuideLinksWithTitles('GameSpot', game_title)
      @site_results << @gamespot_hash

      @giantbomb_hash = nokogiriGetGuideLinksWithTitles('GiantBomb', game_title)
      @site_results << @giantbomb_hash
      
      
    end
    
    @curr_user = User.find_by_fname("default")
    @sites = Site.all
    @prev_queries = Game.pluck("title").uniq

  end
  
end
