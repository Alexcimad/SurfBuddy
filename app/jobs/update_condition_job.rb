class UpdateConditionJob < ApplicationJob
  queue_as :default

  def perform(spot_id)
    # Do something later
    spot = SurfSpot.find(spot_id)
    puts "Destroy old spot conditions for #{spot.location}"
    spot.surf_conditions.destroy_all
    puts "Spot conditions update for #{spot.location} is started"
    fetch_current_conditions(spot)
    puts "Spot conditions update for #{spot.location} is finished"
  end


  private 

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
    elsif wave_height < 2.0
      level = "Intermediate"
      global_rate += 2
    else
      level = "Expert"
      global_rate += 3
    end
  
    if level == "Beginner"
      if wave_height > 0.80
        global_rate += 8
      elsif wave_height > 0.60
        global_rate += 6
      elsif wave_height > 0.40
        global_rate += 4
      else
        global_rate += 2
      end
    end
  
  
    #Use period condition in wave weight condition
    period = args[:period]
    if level != "Beginner"
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
    else
      if period > 6
        global_rate += 1
      end
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
        if level != "Beginner"
          global_rate += 2
        else
          global_rate += 1
        end
      end
    elsif wind_speed < 3
      if level != "Beginner"
        global_rate += 2
      end
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
    for i in 0..12 do
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
end
