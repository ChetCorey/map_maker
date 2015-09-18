json.array!(@maps) do |map|
  json.extract! map, :id, :title, :country, :state, :county
  json.url map_url(map, format: :json)
end
