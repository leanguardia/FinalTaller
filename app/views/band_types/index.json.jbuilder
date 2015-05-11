json.array!(@band_types) do |band_type|
  json.extract! band_type, :id, :model
  json.url band_type_url(band_type, format: :json)
end
