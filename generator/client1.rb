require 'rubygems'
require 'mechanize'
require 'net/http'
require 'uri'

# user = "1"
# band = "1"
# date = ''
# steps_taken = 0
# calories_burnt = 0
# hearth_rate_pminute = 0
# latitude = 0
# longitude = 0

data = {"band_datum[user_id]" => 1, "band_datum[band_id]" => 1, "band_datum[date]" => Time.now, "band_datum[steps_taken]" => 666, "band_datum[calories_burnt]" => 666, "band_datum[hearth_rate_pminute]" => 666, "band_datum[latitude]" => 0, "band_datum[longitude]" => 0}


uri = URI.parse("http://127.0.0.1:3000/band_data.json")

# Full control
http = Net::HTTP.new(uri.host, uri.port)

request = Net::HTTP::Post.new(uri.request_uri)
request.set_form_data(data)

http.request(request)