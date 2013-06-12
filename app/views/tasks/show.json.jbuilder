json.extract! @task, :id, :label, :description, :point, :state, :created_at, :updated_at
json.story_url story_url(@task.sprint_backlog.story.id, format: :json)
json.sprint_url sprint_url(@task.sprint_backlog.sprint.id, format: :json)
