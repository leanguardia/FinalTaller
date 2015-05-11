json.array!(@goals) do |goal|
  json.extract! goal, :id, :start_date, :end_date, :target, :reached, :goal_type_id, :user_id
  json.url goal_url(goal, format: :json)
end
