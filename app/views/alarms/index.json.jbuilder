json.array!(@alarms) do |alarm|
  json.extract! alarm, :id, :user_id, :day_week, :alarm_hour, :state
  json.url alarm_url(alarm, format: :json)
end
