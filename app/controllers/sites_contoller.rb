class GamesController < ApplicationController
  def index
    @sites = Site.all
  end

end
