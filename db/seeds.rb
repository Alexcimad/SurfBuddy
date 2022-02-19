# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "---DESTROYING CURRENT DATA"
SpotReview.destroy_all
SurfSpot.destroy_all
User.destroy_all

CONST_LEVEL = ["Beginner", "Intermediate", "Expert"]
surf_spots = []

# Add Users

puts "----CREATING ALEXIS USER"
user = User.create!(email: 'alex.cimadev@gmail.com', password: "Wagon2021", nickname: "Alexis", level: CONST_LEVEL.sample)

puts "----CREATING THEO USER"
user1 = User.create!(email: 'theogalais@gmail.com',password: "theogalais@gmail.com", nickname: "Théo", level: CONST_LEVEL.sample)

puts "----CREATING DAVID USER"
user2 = User.create!(email: 'davidsantos@live.fr',password: "davidsantos@live.fr", nickname: "David", level: CONST_LEVEL.sample)

puts "----CREATING ARON USER"
user3 = User.create!(email: 'aron@gmail.com',password: "aron@gmail.com", nickname: "Aron", level: CONST_LEVEL.sample)

puts "----CREATING KELLY S. USER"
kellyS = User.create!(email: 'kellyS@gmail.com',password: "WSL2021", nickname: "Kelly", level: CONST_LEVEL.sample)

puts "----CREATING JEREMY F. USER"
jeremyF = User.create!(email: 'jeremyF@gmail.com',password: "WSL2021", nickname: "Jeremy", level: CONST_LEVEL.sample)

# Add Spots

surf_spot1 = SurfSpot.create!(location: "Paris", description: "Lorem Ipsum")
puts "- #{surf_spot1.location}"
surf_spots << surf_spot1

surf_spot2 = SurfSpot.create(location: "Quiberon", description: "Lorem Ipsum")
puts "- #{surf_spot2.location}"
surf_spots << surf_spot2

surf_spot3 = SurfSpot.create(location: "La torche", description: "Lorem Ipsum")
puts "- #{surf_spot3.location}"
surf_spots << surf_spot3

surf_spot4 = SurfSpot.create(location: "Biarritz", description: "Lorem Ipsum")
puts "- #{surf_spot4.location}"
surf_spots << surf_spot4

# Add Reviews
