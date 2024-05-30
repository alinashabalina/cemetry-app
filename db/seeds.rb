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
city = City.new("title": "Prag", "country": "Czech Republic")
city.save!
city = City.new("title": "Dresden", "country": "Germany")
city.save!
city = City.new("title": "Potsdam", "country": "Germany")
city.save!
city = City.new("title": "Brandenburg", "country": "Germany")
city.save!
city = City.new("title": "Magdeburg", "country": "Germany")
city.save!
city = City.new("title": "Leipzig", "country": "Germany")
city.save!
city = City.new("title": "Hamburg", "country": "Germany")
city.save!
city = City.new("title": "Frankfurt", "country": "Germany")
city.save!
gry = Graveyard.new("title": "Dreifaltigkeitskirchhof", "city_id": 2)
gry.save!
gry = Graveyard.new("title": "Dreifaltigkeitskirchhof", "city_id": 17)
gry.save!
