require 'pry' 

def get_first_name_of_season_winner(data, season)
  data[season].map do |contestant|
    if contestant["status"] == "Winner"
      return contestant["name"].split[0]
    end
  end
end

def get_contestant_name(data, occupation)
  data.map do |season, contestants|
    contestants.select do |contestant|
      if contestant["occupation"] == occupation
        return contestant["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  data.map do |season, contestants|
    contestants.select do |contestant|
      contestant["hometown"] == hometown
    end.count
  end.sum
end

def get_occupation(data, hometown)
  data.map do |season, contestants|
    contestants.select do |contestant|
      if contestant["hometown"] == hometown
        return contestant["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  data.select do |season_alt|
    season_alt == season
  end.map do |season_alt, contestants|
    contestants.reduce(0) do |age_total, contestant|
      age_total += contestant["age"].to_f
    end/contestants.length
  end.join.to_f.round
end









# def get_average_age_for_season(data, season)
#   data.map do |season_alt, contestants|
#     if season_alt == season
#       return contestants.values_at("age")
#     end
#   end
# end

# def get_average_age_for_season(data, season)
#   data.select do |season_alt|
#     season_alt == season
#   end.map do |season_alt, contestants|
#     contestants.select do |contestant|
#       return contestant["age"]
#     end
#   end
# end
