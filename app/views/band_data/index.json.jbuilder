json.array!(@band_data) do |band_datum|
  json.extract! band_datum, :id, :user_id, :band_id, :date_sent, :steps_taken, :calories_burnt, :heart_rate_pminute, :longitude, :latitude
  json.url band_datum_url(band_datum, format: :json)
end
