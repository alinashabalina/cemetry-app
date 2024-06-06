# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
city = City.new("title": "Bad Schandau", "country": "Germany")
city.save!
city = City.new("title": "Berlin", "country": "Germany")
city.save!
gry = Graveyard.new("title": "Dreifaltigkeitskirchhof", "city_id": 2, "details": "In der ehemaligen Friedhofskapelle des Friedhofs befindet sich seit Anfang November 2013 eine Dauerausstellung über die Familie Mendelssohn.", "address": "Berlin, Hallesches Tor")
gry.save!
gry = Graveyard.new("title": "Friedhof Bad Schandau", "city_id": 1, "details": "Bad Schandau cemetery contains in total 115 German war graves from World War II.", "address": "01814, Bad Schandau")
gry.save!
