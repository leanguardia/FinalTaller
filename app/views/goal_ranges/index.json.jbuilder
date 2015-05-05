json.array!(@goal_ranges) do |goal_range|
  json.extract! goal_range, :id, :goal_id, :start_time, :end_time
  json.url goal_range_url(goal_range, format: :json)
end
