json.extract! @task, :label, :description, :point, :state, :created_at, :updated_at
json.backlog_story_url product_sprint_backlog_story_url(@product, @sprint, @sprint_backlog, format: :json)
