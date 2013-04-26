json.array!(@sprints) do |sprint|
  json.extract! sprint, :start_date, :end_date, :state
  json.url product_sprint_url(@product, sprint, format: :json)
end
