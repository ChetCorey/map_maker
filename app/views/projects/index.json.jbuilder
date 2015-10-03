json.array!(@projects) do |project|
  json.extract! project, :id, :study_name, :study_date, :map, :user
  json.url project_url(project, format: :json)
end
