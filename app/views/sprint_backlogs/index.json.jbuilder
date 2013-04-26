json.array!(@sprint_backlogs) do |sprint_backlog|
  json.extract! sprint_backlog, :id, :created_at, :updated_at
  json.url product_sprint_story_url(@product, @sprint, sprint_backlog.story, format: :json)
end
