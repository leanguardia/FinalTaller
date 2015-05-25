require 'rubygems'
require 'mechanize'
require 'net/http'
require 'uri'

puts 'Desired user id'
user = gets.chomp
puts 'Desired band id'
band = gets.chomp
puts 'Start year'
year = gets.chomp
puts 'Start month'
month = gets.chomp
puts 'Start day'
day = gets.chomp
date = Time.new(year, month, day)

data = {'band_datum[user_id]' => user, 'band_datum[band_id]' => band, 'band_datum[date_sent]' => date, 'band_datum[steps_taken]' => 666, 'band_datum[calories_burnt]' => 666, 'band_datum[heart_rate_pminute]' => 666, 'band_datum[latitude]' => 0, 'band_datum[longitude]' => 0}


uri = URI.parse('http://127.0.0.1:3000/band_data.json')

# Full control
http = Net::HTTP.new(uri.host, uri.port)

Thread.new do
  while line = STDIN.gets
    break if line.chomp == 'x'
  end
  exit
end

loop do
  date = date + 10*60
  sleep 1
  data['band_datum[date_sent]'] = date
  data['band_datum[steps_taken]'] = rand(100)
  data['band_datum[calories_burnt]'] = data['band_datum[steps_taken]'] * 0.5 + rand(10)
  data['band_datum[heart_rate_pminute]'] = 30 + rand(200)
  data['band_datum[latitude]'] = 0
  data['band_datum[longitude]'] = 0

  pp(data)
  puts

  request = Net::HTTP::Post.new(uri.request_uri)
  request.set_form_data(data)
  http.request(request)
end

# (0..10).each do
#   date = date + 10*60
#   data['band_datum[date_sent]'] = date
#   data['band_datum[steps_taken]'] = rand(100)
#   data['band_datum[calories_burnt]'] = data['band_datum[steps_taken]'] * 0.5 + rand(10)
#   data['band_datum[heart_rate_pminute]'] = 30 + rand(200)
#   data['band_datum[latitude]'] = 0
#   data['band_datum[longitude]'] = 0
#
#   request = Net::HTTP::Post.new(uri.request_uri)
#   request.set_form_data(data)
#   http.request(request)
# end