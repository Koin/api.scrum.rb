json.array!(@sprints) do |sprint|
  json.extract! sprint, :id, :start_date, :end_date, :state
  json.url sprint_url(sprint, format: :json)
end
