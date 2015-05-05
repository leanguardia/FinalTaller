json.array!(@goals) do |goal|
  json.extract! goal, :id, :goal_type_id, :target, :current
  json.url goal_url(goal, format: :json)
end
