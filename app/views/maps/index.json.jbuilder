json.array!(@maps) do |map|
  json.extract! map, :id, :title, :subtitle, :meta_data
  json.url map_url(map, format: :json)
end
