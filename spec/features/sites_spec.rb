require 'spec_helper'

describe "Sites" do
  
  before(:all) do
    Site.create(name: "IGN", base_url: "www.ign.com", search_string: "/search?q=", logo_img: "ign-logo_288x288.jpg", background_img: "ign-logo_288x288.jpg")
    Site.create(name: "GameSpot", base_url: "www.gamespot.com", search_string: "/search/?indices[0]=game&page=1&q=", logo_img: "gamespot_logo.png", background_img: "gamespot_logo.png")
    Site.create(name: "GiantBomb", base_url: "www.giantbomb.com", search_string: "/search/?q=", logo_img: "giant-bomb.png", background_img: "giant-bomb.png")
    Site.create(name: "GamesRadar", base_url: "www.gamesradar.com", logo_img: "gamesradar.png", background_img: "gamesradar.png")
    Site.create(name: "Game Guides", base_url: "www.gamepressure.com", logo_img: "gamepressure.png", background_img: "gamepressure.png")
    Site.create(name: "GameFAQs", base_url: "www.gamefaqs.com", logo_img: "gamefaqs.jpg", background_img: "gamefaqs.jpg")
    Site.create(name: "ViedoGames Blogger", base_url: "www.videogamesblogger.com", logo_img: "vgblogo.png", background_img: "vgblogo.png")
    @implemented_sites = ["IGN", "GameSpot", "GiantBomb"]
    @curr_user= User.create(fname: "default", lname: "user", email: "nobody@some.email", password: "pass")
  end
  
  it "loads main GAMEZelp page" do #, :js => true do
    visit sites_path
    expect(page).to have_content("GAMEZelp")
  end
  
  it "has access to game sites database" do
    visit sites_path
    expect(Site.count).to be > 0
  end
  
  it "contains prompt to enter game title in on of the implemented site cells" do
    visit sites_path
    expect(first(".guideLinks")).to have_content("Enter Game Title for Search...")
  end
  
  it "contains a comming soon prompt for non-implemented site cells" do
    visit sites_path
    boxes = page.all(".guideLinks")
    boxes.each_with_index do |b, i|
      if i >= @implemented_sites.count
        expect(b).to have_content("Coming Soon...")
      end
    end
  end
  
end
