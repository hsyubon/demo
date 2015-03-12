json.array!(@qwerns) do |qwern|
  json.extract! qwern, :id, :name, :bio, :birthday
  json.url qwern_url(qwern, format: :json)
end
