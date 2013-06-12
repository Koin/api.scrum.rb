json.extract! @sprint_backlog, :id, :order, :created_at, :updated_at
json.sprint_url sprint_url(@sprint_backlog.sprint, format: :json)
json.story_url story_url(@sprint_backlog.story, format: :json)
