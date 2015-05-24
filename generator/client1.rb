require 'rubygems'
require 'mechanize'

# user = "1"
# band = "1"
# date = ''
# steps_taken = 0
# calories_burnt = 0
# hearth_rate_pminute = 0
# latitude = 0
# longitude = 0

data = {"band_data[user_id]" => 1, "band_data[band_id]" => 1, "band_data[date]" => Time.now, "band_data[steps_taken]" => 666, "band_data[calories_burnt]" => 666, "band_data[hearth_rate_pminute]" => 666, "band_data[latitude]" => 0, "band_data[longitude]" => 0}

agent = Mechanize.new
agent.auth('admin@gmail.com', '12345678')

page = agent.get('http://localhost:3000/goals')
puts page.title

# json = agent.post('http://localhost:3000/band_data.json', data).body
# result = JSON.parse json
# puts result

# json = Mechanize.new.post('http://localhost:3000/band_data.json', data).body
# result = JSON.parse json
# puts result