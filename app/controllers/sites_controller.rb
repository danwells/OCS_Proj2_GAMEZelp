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
        
    @implemented_sites = ["IGN", "GameSpot", "GiantBomb"]
    @site_results = []
    if (game_title)
      Site.where(name: @implemented_sites).each do |s|
        @site_results << s.guideLinksHash(game_title)
      end      
      
      # @ign_hash = Site.find_by_name('IGN').guideLinksHash(game_title)  
      # @site_results << @ign_hash
      # 
      # @gamespot_hash = Site.find_by_name('GameSpot').guideLinksHash(game_title) 
      # @site_results << @gamespot_hash
      # 
      # @giantbomb_hash = Site.find_by_name('GiantBomb').guideLinksHash(game_title) 
      # @site_results << @giantbomb_hash
      
    end
    
    @curr_user = User.find_by_fname("default")
    @sites = Site.all
    @prev_queries = Game.pluck("title").uniq

  end
  
end
