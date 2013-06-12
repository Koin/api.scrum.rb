json.array!(@sprint_backlogs) do |sprint_backlog|
  json.extract! sprint_backlog, :id, :order
  json.url sprint_story_url(@sprint, sprint_backlog, format: :json)
end
