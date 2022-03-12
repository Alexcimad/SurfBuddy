# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

puts "-DESTROYING CURRENT DATA"
SurfSession.destroy_all
SurfSpot.destroy_all
User.destroy_all
Tag.destroy_all
FavoriteSpotTag.destroy_all
SurfCondition.destroy_all
FavoriteSpot.destroy_all
SpotReview.destroy_all

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
file_user = URI.open("http://res.cloudinary.com/dmnzqtckp/image/upload/v1646859730/mevgwuhni89gsyovx4u6.jpg")
surf_spot1.photos.attach(io: file_user, filename: "alexis_photo.jpg", content_type: "image/jpg")
puts "---CREATING #{surf_spot1.location}"

surf_spots << surf_spot1

surf_spot2 = SurfSpot.create!(location: "Quiberon", description: "Lorem Ipsum")
file_user2 = URI.open("http://res.cloudinary.com/dmnzqtckp/image/upload/v1646859007/cpdfnelsn1hyh6bozovp.jpg")
surf_spot2.photos.attach(io: file_user2, filename: "quiberon_photo.jpg", content_type: "image/jpg")
puts "---CREATING #{surf_spot2.location}"
surf_spots << surf_spot2

surf_spot3 = SurfSpot.create!(location: "Culs nus Hossegor", longitude: -1.44018, latitude: 43.6773, description: "Awesome beach for surfing while being naked")
puts "---CREATING #{surf_spot3.location}"
file_user3 = URI.open("http://res.cloudinary.com/dmnzqtckp/image/upload/v1646940558/cx8g9oted6smctk5uxxa.jpg")
surf_spot3.photos.attach(io: file_user3, filename: "cul_nus.jpg", content_type: "image/jpg")
surf_spots << surf_spot3

surf_spot4 = SurfSpot.create!(location: "Grande Plage Biarritz", description: "Awesome beach for surfing just before going to the casino ;)")
puts "---CREATING #{surf_spot4.location}"
file_user4 = URI.open("http://res.cloudinary.com/dmnzqtckp/image/upload/v1646859521/o5ryzpmrzqgwampwjr3o.jpg")
surf_spot4.photos.attach(io: file_user4, filename: "btz_grde_plage_photo.jpg", content_type: "image/jpg")
surf_spots << surf_spot4

surf_spot5 = SurfSpot.create!(location: "Côte des basques", description: "Great beach! Really secure for family surfing with a great view of villa Belza")
puts "---CREATING #{surf_spot5.location}"
file_user5 = URI.open("http://res.cloudinary.com/dmnzqtckp/image/upload/v1646859305/l14arziphmzwtbxxlf7c.jpg")
surf_spot5.photos.attach(io: file_user5, filename: "alexis_photo.jpg", content_type: "image/jpg")
surf_spots << surf_spot5

surf_spot6 = SurfSpot.create!(location: "Grande plage Quiberon", description: "Beautiful beach of Quiberon even if it's a little cold for surfing")
puts "---CREATING #{surf_spot6.location}"
file_user6 = URI.open("http://res.cloudinary.com/dmnzqtckp/image/upload/v1646940387/s9uulc5zkbmj0pbtg4r5.jpg")
surf_spot6.photos.attach(io: file_user6, filename: "grde_plage_quiberon.jpg", content_type: "image/jpg")
surf_spots << surf_spot6

surf_spot7 = SurfSpot.create!(location: "Plage de sainte barbe", description: "Great naturist and surfing beach but a little cold. I prefer basque country!")
puts "---CREATING #{surf_spot7.location}"
file_user7 = URI.open("http://res.cloudinary.com/dmnzqtckp/image/upload/v1646940260/d6s0jiwaliuh7fuehh1q.jpg")
surf_spot7.photos.attach(io: file_user7, filename: "sainte_barbe.jpg", content_type: "image/jpg")
surf_spots << surf_spot7

surf_spot8 = SurfSpot.create!(location: "Plage Hendaye", description: "Great nice and big beach to begin surfing safely")
puts "---CREATING #{surf_spot8.location}"
file_user8 = URI.open("http://res.cloudinary.com/dmnzqtckp/image/upload/v1647099659/obzhz2jjt2qxssel5yzz.jpg")
surf_spot8.photos.attach(io: file_user8, filename: "hendaye.jpg", content_type: "image/jpg")
surf_spots << surf_spot8

surf_spot9 = SurfSpot.create!(location: "Plage du penon", description: "Big beach in the Landes for surfing and family time")
puts "---CREATING #{surf_spot9.location}"
file_user9 = URI.open("http://res.cloudinary.com/dmnzqtckp/image/upload/v1647101018/gnutizz6e2vl8boxezwi.jpg")
surf_spot9.photos.attach(io: file_user9, filename: "hendaye.jpg", content_type: "image/jpg")
surf_spots << surf_spot9

# Add Reviews
spot_review1 = SpotReview.create!(comment: "I love this beach it was awesome", rating: 4, surf_spot_id: surf_spot1.id, user_id: user1.id)
puts "----CREATING #{spot_review1.rating} stars"
spot_reviews << spot_review1

spot_review2 = SpotReview.create!(comment: "What a great place for surfing!", rating: 3, surf_spot_id: surf_spot2.id, user_id: user1.id)
puts "----CREATING #{spot_review2.rating} stars"
spot_reviews << spot_review2

spot_review3 = SpotReview.create!(comment: "I wish I could surf there avery day all day!", rating: 3, surf_spot_id: surf_spot3.id, user_id: user1.id)
puts "----CREATING #{spot_review3.rating} stars"
spot_reviews << spot_review3

spot_review4 = SpotReview.create!(comment: "Very good surfing spot even if it is a bit rocky!", rating: 4, surf_spot_id: surf_spot1.id, user_id: user2.id)
puts "----CREATING #{spot_review4.rating} stars"
spot_reviews << spot_review4

spot_review5 = SpotReview.create!(comment: "Perfect for a surf lover as I am!", rating: 5, surf_spot_id: surf_spot1.id, user_id: user2.id)
puts "----CREATING #{spot_review5.rating} stars"
spot_reviews << spot_review5

spot_review6 = SpotReview.create!(comment: "perfect spot for beginner surfer with a beautiful view on Villa Belza!", rating: 5, surf_spot_id: surf_spot5.id, user_id: user1.id)
puts "----CREATING #{spot_review6.rating} stars"
spot_reviews << spot_review6

spot_review7 = SpotReview.create!(comment: "Really nice surf spot for beginner in Britanny really close to visit Plouharnel! I recommend!", rating: 5, surf_spot_id: surf_spot7.id, user_id: user1.id)
puts "----CREATING #{spot_review7.rating} stars"
spot_reviews << spot_review7




# Add Favorite_spots

puts "----CREATING FAVORITES SPOTS"
fav_spot1 = FavoriteSpot.create!(surf_spot_id: surf_spot1.id ,user_id: user2.id)
fav_spot2 = FavoriteSpot.create!(surf_spot_id: surf_spot2.id ,user_id: user2.id)
fav_spot3 = FavoriteSpot.create!(surf_spot_id: surf_spot3.id ,user_id: user1.id)
fav_spot4 = FavoriteSpot.create!(surf_spot_id: surf_spot4.id ,user_id: user3.id)


# Add Tags

puts "----CREATING TAGS"
tag1 = Tag.create!(name: "beach break")
tag2 = Tag.create!(name: "reef break")
tag3 = Tag.create!(name: "galets")
tag4 = Tag.create!(name: "sable")
tag5 = Tag.create!(name: "roches")

# Add Favorite_spots_tags

puts "----CREATING FAVORITES SPOTS TAGS"
FavoriteSpotTag.create!(favorite_spot_id: fav_spot1.id, tag_id: tag2.id)
FavoriteSpotTag.create!(favorite_spot_id: fav_spot1.id, tag_id: tag4.id)
FavoriteSpotTag.create!(favorite_spot_id: fav_spot3.id, tag_id: tag3.id)
FavoriteSpotTag.create!(favorite_spot_id: fav_spot4.id, tag_id: tag3.id)

puts "------CREATING INITIAL SURF CONDITIONS FOR SPOTS"

def convert_API_response_to_hash(windy_response)
  timestamp=windy_response["ts"]
  index_near_future = timestamp.index(timestamp.find { |element| Time.at(element/1000) >= Time.now})
  windy_response.delete("units")
  windy_response.delete("warning")
  return [index_near_future, windy_response.values.transpose.map { |vs| windy_response.keys.zip(vs).to_h }]
end

def calc_wind_direction(v_wind_direction_rad)
  wind_dir_result = ""
  if (v_wind_direction_rad < 0)
    v_wind_direction_rad = v_wind_direction_rad + 2 * Math::PI
  end

  if v_wind_direction_rad <= (Math::PI/8) && v_wind_direction_rad > 0
    wind_dir_result = "E"
  elsif v_wind_direction_rad <= (3*Math::PI/8) && v_wind_direction_rad > (Math::PI/8)
    wind_dir_result = "NE"
  elsif v_wind_direction_rad <= (5*Math::PI/8) && v_wind_direction_rad > (3*Math::PI/8)
    wind_dir_result = "N"
  elsif v_wind_direction_rad <= (7*Math::PI/8)  && v_wind_direction_rad > (5*Math::PI/8)
    wind_dir_result = "NW"
  elsif v_wind_direction_rad <= (9*Math::PI/8) && v_wind_direction_rad > (7*Math::PI/8)
    wind_dir_result = "W"
  elsif v_wind_direction_rad <= (11*Math::PI/8) && v_wind_direction_rad > (9*Math::PI/8)
    wind_dir_result = "SW"
  elsif v_wind_direction_rad <= (13*Math::PI/8) && v_wind_direction_rad > (11*Math::PI/8)
    wind_dir_result = "S"
  elsif v_wind_direction_rad <= (15*Math::PI/8) && v_wind_direction_rad > (13*Math::PI/8)
    wind_dir_result = "SE"
  elsif v_wind_direction_rad <= (2*Math::PI/8) && v_wind_direction_rad > (15*Math::PI/8)
    wind_dir_result = "E"
  else
    wind_dir_result = "E"
  end

  return wind_dir_result
end

def calculate_spot_level_rating(args={})
  global_rate = 0
  level = ""

  # Use wave weight condition in calculation
  wave_height = args[:wave_height]
  if wave_height < 1.0
    level = "Beginner"
    global_rate += 1
  elsif wave_height < 2.0
    level = "Intermediate"
    global_rate += 2
  else
    level = "Expert"
    global_rate += 3
  end

  #Use period condition in wave weight condition
  period = args[:period]
  if period <= 5
    global_rate += 1
  elsif (6..8).include? period
    global_rate +=2
  elsif (9..10).include? period
    global_rate +=3
  elsif (11..12).include? period
    global_rate +=4
  else
    global_rate += 5
  end

  # Use wind direction/speed into calculation
  wind_speed = args[:wind_speed]
  wind_dir = args[:wind_direction]
  if wind_speed > 7
    case wind_dir
    when "NW"
    when "SW"
      global_rate += 1
    when "W"
      global_rate += 2
    end
  elsif wind_speed < 3
    global_rate += 2
  end

  return {level: level, rating: global_rate}

end

def fetch_current_conditions(surf_spot)
  # fetch wave information for each spot
  response = HTTParty.post("https://api.windy.com/api/point-forecast/v2",
  body:{lat: surf_spot.latitude,
      lon: surf_spot.longitude,
      model: "gfsWave",
      parameters: ["waves", "windWaves", "swell1"],
      key: ENV['WINDY_API_KEY']
      }.to_json,
  headers: {
  'Content-Type' => 'application/json',
  'Accept'=> 'application/json, text/plain, */*'
  })
  response_JSON = JSON.parse(response.body)
  waves_info = convert_API_response_to_hash(response_JSON)

  response_wind_temp = HTTParty.post("https://api.windy.com/api/point-forecast/v2",
    body:{lat: surf_spot.latitude,
          lon: surf_spot.longitude,
          model: "iconEu",
          parameters: ["temp", "wind"],
          key: ENV['WINDY_API_KEY']
          }.to_json,
    headers: {
    'Content-Type' => 'application/json',
    'Accept'=> 'application/json, text/plain, */*'
    })

  response_wind_temp_JSON = JSON.parse(response_wind_temp.body)
  wind_info = convert_API_response_to_hash(response_wind_temp_JSON)
  for i in 0..7 do
    wind_speed = Math.sqrt(wind_info[1][wind_info[0]+i]["wind_u-surface"]**2 + wind_info[1][wind_info[0]+i]["wind_v-surface"]**2)/0.514
    wind_direction_rad = Math.atan2(wind_info[1][wind_info[0]+i]["wind_v-surface"],wind_info[1][wind_info[0]+i]["wind_u-surface"])
    wind_direction = calc_wind_direction(wind_direction_rad)
    rating_results = calculate_spot_level_rating({wave_height: waves_info[1][waves_info[0]+i]["waves_height-surface"], period: waves_info[1][waves_info[0]+i]["waves_period-surface"].to_i, wind_direction: wind_direction, wind_speed: wind_speed })
    surf_condition = SurfCondition.new(wave: waves_info[1][waves_info[0]+i]["waves_height-surface"],
                                      swell: waves_info[1][waves_info[0]+i]["swell1_height-surface"],
                                      period: waves_info[1][waves_info[0]+i]["waves_period-surface"].to_i,
                                      temp: (wind_info[1][wind_info[0]+i]["temp-surface"] - 273.15).to_i,
                                      wind_speed: wind_speed,
                                      wind_direction: wind_direction,
                                      rating: rating_results[:rating],
                                      level: rating_results[:level],
                                      start_hour: Time.at(waves_info[1][waves_info[0]+i]["ts"]/1000))
    surf_condition.surf_spot = surf_spot
    surf_condition.save!
  end
end

SurfSpot.all.each do |spot|
  fetch_current_conditions(spot)
end
