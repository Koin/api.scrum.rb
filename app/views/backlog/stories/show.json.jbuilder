json.extract! @sprint_backlog, :id, :order, :created_at, :updated_at
json.sprint_url product_sprint_url(@product, @sprint_backlog.sprint, format: :json)
json.story_url product_story_url(@product, @sprint_backlog.story, format: :json)
