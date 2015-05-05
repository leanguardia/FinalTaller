json.array!(@goal_types) do |goal_type|
  json.extract! goal_type, :id, :description, :unit_measured
  json.url goal_type_url(goal_type, format: :json)
end
