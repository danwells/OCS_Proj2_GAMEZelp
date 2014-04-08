class SitesController < ApplicationController
  def index
    if params[:gameQuery]
      puts params[:gameQuery]
    end
    @sites = Site.all
  end
end
