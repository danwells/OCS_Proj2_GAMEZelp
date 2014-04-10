# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(fname: "default", lname: "user", email: "nobody@some.email", password: "pass")

Site.create(name: "IGN", base_url: "www.ign.com", search_string: "/search?q=", logo_img: "ign-logo_288x288.jpg", background_img: "ign-logo_288x288.jpg")
Site.create(name: "GameSpot", base_url: "www.gamespot.com", search_string: "/search/?indices[0]=game&page=1&q=", logo_img: "gamespot_logo.png", background_img: "gamespot_logo.png")
Site.create(name: "GiantBomb", base_url: "www.giantbomb.com")
Site.create(name: "GamesRadar", base_url: "www.gamesradar.com")
Site.create(name: "Game Guides", base_url: "www.gamepressure.com")
Site.create(name: "ViedoGames Blogger", base_url: "www.videogamesblogger.com")
Site.create(name: "GameFAQs", base_url: "www.gamefaqs.com")
