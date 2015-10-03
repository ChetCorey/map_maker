json.array!(@records) do |record|
  json.extract! record, :id, :fips, :value, :user_id, :study_id, :map_id
  json.url record_url(record, format: :json)
end
