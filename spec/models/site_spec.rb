require 'spec_helper'

describe Site do
  before(:all) do
    Site.create(name: "IGN", base_url: "www.ign.com", search_string: "/search?q=", logo_img: "ign-logo_288x288.jpg", background_img: "ign-logo_288x288.jpg")
    Site.create(name: "GameSpot", base_url: "www.gamespot.com", search_string: "/search/?indices[0]=game&page=1&q=", logo_img: "gamespot_logo.png", background_img: "gamespot_logo.png")
    Site.create(name: "GiantBomb", base_url: "www.giantbomb.com", search_string: "/search/?q=", logo_img: "giant-bomb.png", background_img: "giant-bomb.png")
    Site.create(name: "GamesRadar", base_url: "www.gamesradar.com", logo_img: "gamesradar.png", background_img: "gamesradar.png")
    Site.create(name: "Game Guides", base_url: "www.gamepressure.com", logo_img: "gamepressure.png", background_img: "gamepressure.png")
    Site.create(name: "GameFAQs", base_url: "www.gamefaqs.com", logo_img: "gamefaqs.jpg", background_img: "gamefaqs.jpg")
    Site.create(name: "ViedoGames Blogger", base_url: "www.videogamesblogger.com", logo_img: "vgblogo.png", background_img: "vgblogo.png")
    @implemented_sites = ["IGN", "GameSpot", "GiantBomb"]
  end
  
  it "maintains a list of css selectors for site names" do
    expect(Site::CSS_SELECTORS.count).to be > 0
  end
  
  it "maintains a list of css selectors for implemented sites" do
    expect(Site::CSS_SELECTORS.count).to eq(@implemented_sites.count)
  end
  
  it "has an IGN css selector" do
    site = Site.find_by_name("IGN")
    expect(Site::CSS_SELECTORS[site.name]).to eq("#search-page #search-list .search-item-title a")
  end
  
  it "has a GameSpot css selector" do
    site = Site.find_by_name("GameSpot")
    expect(Site::CSS_SELECTORS[site.name]).to eq("ul#js-sort-filter-results.editorial.river.search-results li a")
  end
  
  it "has a GiantBomb css selector" do
    site = Site.find_by_name("GiantBomb")
    expect(Site::CSS_SELECTORS[site.name]).to eq("ul#js-sort-filter-results.editorial.river.search-results li a")
  end
  
  it "returns a hash of guide links" do
    site = Site.find_by_name("IGN")
    game_title = "battlefield 4"
    expect(site.guideLinksHash(game_title)).to be_an_instance_of(Hash)
  end
  
  it "returns a hash of an equal number of link titles and urls" do
    site = Site.find_by_name("IGN")
    game_title = "battlefield 4"
    linksHash = site.guideLinksHash(game_title)
    expect(linksHash["titles"].count).to eq(linksHash["links"].count)
  end
  
  it "returns guide links of site specific urls" do
    site = Site.find_by_name("IGN")
    game_title = "battlefield 4"
    linksHash = site.guideLinksHash(game_title)
    expect(linksHash["links"][0]).to include(site.base_url)
  end
  
  
end
