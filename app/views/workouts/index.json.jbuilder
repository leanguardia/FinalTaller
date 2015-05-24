json.array!(@workouts) do |workout|
  json.extract! workout, :id, :user_id, :workout_type_id, :start, :end, :calories, :heartrate, :name
  json.url workout_url(workout, format: :json)
end
