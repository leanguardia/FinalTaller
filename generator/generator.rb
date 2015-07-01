require 'rubygems'
require 'mechanize'
require 'net/http'
require 'uri'

puts 'Desired user id'
user = gets.chomp
puts 'Desired band id'
band = gets.chomp
puts 'Desired workout id (0 for none)'
# workout = 0
# workout = gets.chomp
# if workout == 0
#   workout = nil
# end
puts 'Start year'
year = gets.chomp
puts 'Start month'
month = gets.chomp
puts 'Start day'
day = gets.chomp
date = Time.new(year, month, day, 00, 00)
start_latitude = -17.378993
longitude = -66.162296
interval = 0.000205

data = {'band_datum[user_id]' => user, 'band_datum[band_id]' => band, 'band_datum[date_sent]' => date, 'band_datum[steps_taken]' => 666, 'band_datum[calories_burnt]' => 666, 'band_datum[heart_rate_pminute]' => 666, 'band_datum[latitude]' => start_latitude, 'band_datum[longitude]' => longitude}


#cambiar destino de los datos
uri = URI.parse('http://127.0.0.1:3000/band_data.json')
# uri = URI.parse('http://binaryband.herokuapp.com/band_data.json')


http = Net::HTTP.new(uri.host, uri.port)

Thread.new do
  while line = STDIN.gets
    break if line.chomp == 'x'
  end
  exit
end

loop do
  sleep 0.01
  data['band_datum[date_sent]'] = date
  data['band_datum[steps_taken]'] = rand(100)
  data['band_datum[calories_burnt]'] = data['band_datum[steps_taken]'] /2 + rand(50)
  data['band_datum[heart_rate_pminute]'] = 30 + rand(200)
  data['band_datum[longitude]'] += interval

  pp(data)
  puts

  request = Net::HTTP::Post.new(uri.request_uri)
  request.set_form_data(data)
  http.request(request)
  date = date + 10*60
end