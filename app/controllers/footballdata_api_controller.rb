class FootballDataAPIController

  # Configure API at runtime. See documentation for more info:
  # https://github.com/delta4d/football-data
  FootballData.configure do |config|
    # get api key at 'http://api.football-data.org/register'
    config.api_key = "e60b423919674a7586a30350e2cc359c"

    # default api version is 'alpha' if not setted
    config.api_version = 'v1'

    # the default control method is 'full' if not setted
    # see request section on 'http://api.football-data.org/documentation'
    config.response_control = 'full'
  end

  def self.get_team(id)
    #Define custom method for fetch since the provided method is terrible
    FootballData.fetch(resource = :teams, subresource = nil, params={id: id})
  end

  def self.create_team(data, counter = nil)
    #Create team in Teams table based on data; if data is not valid a message
    # is returned instead. Provide the counter for more informational message
    if data.keys.include?("error")
      puts "No team entered.\nCounter value: #{counter}\nData: #{data}"
    else
      Team.new(Team.create_assignment_hash(data)).tap do |t|
        if t.save
          puts "Team saved.\nName:#{data["name"]}\nid:#{t.id}"
        else
          puts "!!**TEAM NOT SAVED**!!\nName:#{data["name"]}"
        end
      end
    end
  end

  def self.request_next_50
    #Based on last team in teams table, call API for next 50 and create those
    #teams
    counter = Team.all.last.id + 1
    max_requests = counter + 50
    while counter < max_requests
      data = get_team(counter)
      create_team(data,counter)
      counter += 1
    end
  end

end
