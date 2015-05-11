json.array!(@bands) do |band|
  json.extract! band, :id, :color, :user_id, :Band_type_id
  json.url band_url(band, format: :json)
end
