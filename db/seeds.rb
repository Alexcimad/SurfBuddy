# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

puts "-DESTROYING CURRENT DATA"
FavoriteSpot.destroy_all
SpotReview.destroy_all
SurfSpot.destroy_all
User.destroy_all
SurfCondition.destroy_all

CONST_LEVEL = ["Beginner", "Intermediate", "Expert"]
surf_spots = []
spot_reviews = []

# Add Users

puts "--CREATING ALEXIS USER"
user = User.create!(email: 'alex.cimadev@gmail.com', password: "Wagon2021", nickname: "Alexis", level: CONST_LEVEL.sample)

puts "--CREATING THEO USER"
user1 = User.create!(email: 'theogalais@gmail.com',password: "theogalais@gmail.com", nickname: "Théo", level: CONST_LEVEL.sample)

puts "--CREATING DAVID USER"
user2 = User.create!(email: 'davidsantos@live.fr',password: "davidsantos@live.fr", nickname: "David", level: CONST_LEVEL.sample)

puts "--CREATING ARON USER"
user3 = User.create!(email: 'aron@gmail.com',password: "aron@gmail.com", nickname: "Aron", level: CONST_LEVEL.sample)

puts "--CREATING KELLY S. USER"
kellyS = User.create!(email: 'kellyS@gmail.com',password: "WSL2021", nickname: "Kelly", level: CONST_LEVEL.sample)

puts "--CREATING JEREMY F. USER"
jeremyF = User.create!(email: 'jeremyF@gmail.com',password: "WSL2021", nickname: "Jeremy", level: CONST_LEVEL.sample)

# Add Spots

surf_spot1 = SurfSpot.create!(location: "Lacanau", description: "Lorem Ipsum")
file_user = URI.open("https://res.cloudinary.com/dmnzqtckp/image/upload/v1644534494/pzrxzpomr8mup05gnztk.jpg")
surf_spot1.photos.attach(io: file_user, filename: "alexis_photo.jpg", content_type: "image/jpg")
file_user2 = URI.open("https://res.cloudinary.com/dmnzqtckp/image/upload/v1644534494/pzrxzpomr8mup05gnztk.jpg")
surf_spot1.photos.attach(io: file_user2, filename: "alexis_photo.jpg", content_type: "image/jpg")
puts "---CREATING #{surf_spot1.location}"

surf_spots << surf_spot1

surf_spot2 = SurfSpot.create!(location: "Quiberon", description: "Lorem Ipsum")
puts "---CREATING #{surf_spot2.location}"
surf_spots << surf_spot2

surf_spot3 = SurfSpot.create!(location: "Hossegor", description: "Lorem Ipsum")
puts "---CREATING #{surf_spot3.location}"
surf_spots << surf_spot3

surf_spot4 = SurfSpot.create!(location: "Biarritz", description: "Lorem Ipsum")
puts "---CREATING #{surf_spot4.location}"
surf_spots << surf_spot4

# Add Reviews

spot_review1 = SpotReview.create!(comment: "Llorem Ipsum", rating: 4, surf_spot_id: surf_spot1.id, user_id: user1.id)
puts "----CREATING #{spot_review1.rating} stars"
spot_reviews << spot_review1

spot_review2 = SpotReview.create!(comment: "Llorem Ipsum", rating: 3, surf_spot_id: surf_spot2.id, user_id: user1.id)
puts "----CREATING #{spot_review2.rating} stars"
spot_reviews << spot_review2

spot_review3 = SpotReview.create!(comment: "Llorem Ipsum", rating: 3, surf_spot_id: surf_spot3.id, user_id: user1.id)
puts "----CREATING #{spot_review3.rating} stars"
spot_reviews << spot_review3

spot_review4 = SpotReview.create!(comment: "Llorem Ipsum", rating: 4, surf_spot_id: surf_spot1.id, user_id: user2.id)
puts "----CREATING #{spot_review4.rating} stars"
spot_reviews << spot_review4

spot_review5 = SpotReview.create!(comment: "Llorem Ipsum", rating: 5, surf_spot_id: surf_spot1.id, user_id: user2.id)
puts "----CREATING #{spot_review5.rating} stars"
spot_reviews << spot_review5

# Add Favorite_spots

puts "----CREATING FAVORITES SPOTS"
fav_spot1 = FavoriteSpot.create!(surf_spot_id: surf_spot1.id ,user_id: user2.id)

puts "------CREATING INITIAL SURF CONDITIONS FOR SPOTS"

SurfSpot.all.each do |spot|
  response = HTTParty.post("https://api.windy.com/api/point-forecast/v2",
  body:{lat: spot.latitude,
      lon: spot.longitude,
      model: "gfsWave",
      parameters: ["waves", "windWaves", "swell1"],
      key: ENV['WINDY_API_KEY']
      }.to_json,
  headers: {
  'Content-Type' => 'application/json',
  'Accept'=> 'application/json, text/plain, */*'
  })
  response_JSON = JSON.parse(response.body)
  timestamp=response_JSON["ts"]
  index_near_future = timestamp.index(timestamp.find { |element| Time.at(element) >= Time.now})
  response_JSON.delete("units")
  response_JSON.delete("warning")
  array_hash = response_JSON.values.transpose.map { |vs| response_JSON.keys.zip(vs).to_h }
  surf_condition = SurfCondition.new(wave: array_hash[index_near_future]["waves_height-surface"],
                                     swell: array_hash[index_near_future]["swell1_height-surface"],
                                     period: array_hash[index_near_future]["waves_period-surface"].to_i)
  
  surf_condition.surf_spot = spot
  surf_condition.save!

  end