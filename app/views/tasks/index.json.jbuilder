json.array!(@tasks) do |task|
  json.extract! task, :label, :description, :point, :state
  json.url product_sprint_story_task_url(@product, @sprint, @story, task, format: :json)
end
