json.array!(@users) do |user|
  json.extract! user, :id, :name, :lastname, :sex, :weight, :height, :birthdate, :role, :active, :email, :password_hash, :password_salt
  json.url user_url(user, format: :json)
end
