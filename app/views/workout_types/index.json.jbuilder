json.array!(@workout_types) do |workout_type|
  json.extract! workout_type, :id, :typename, :outside
  json.url workout_type_url(workout_type, format: :json)
end
