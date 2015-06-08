json.array!(@sleeps) do |sleep|
  json.extract! sleep, :id, :started_at, :awaken_at
  json.url sleep_url(sleep, format: :json)
end
