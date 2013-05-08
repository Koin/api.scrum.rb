json.array!(@tasks) do |task|
  json.extract! task, :label, :description, :point, :state
  json.url product_sprint_backlog_story_task_url(@product, @sprint, @sprint_backlog, task, format: :json)
end
