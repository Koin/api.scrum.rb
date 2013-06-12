json.extract! @task, :id, :label, :description, :point, :state, :created_at, :updated_at
json.story_url story_url(@task.story.id, format: :json)
