json.array!(@sprint_backlogs) do |sprint_backlog|
  json.extract! sprint_backlog, :id, :order, :created_at, :updated_at
  json.url product_sprint_backlog_story_url(@product, @sprint, sprint_backlog, format: :json)
end
