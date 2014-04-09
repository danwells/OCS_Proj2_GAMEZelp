# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Site.create(name: "IGN", base_url: "www.ign.com", search_string: "/search?q=", logo_img: "ign-logo_288x288.jpg", background_img: "ign-logo_288x288.jpg")
Site.create(name: "GameSpot", base_url: "www.gamespot.com")
Site.create(name: "GiantBomb", base_url: "www.giantbomb.com")
Site.create(name: "GamesRadar", base_url: "www.gamesradar.com")
Site.create(name: "Game Guides", base_url: "www.gamepressure.com")
Site.create(name: "ViedoGames Blogger", base_url: "www.videogamesblogger.com")
Site.create(name: "GameFAQs", base_url: "www.gamefaqs.com")
