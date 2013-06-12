json.array!(@tasks) do |task|
  json.extract! task, :id, :label, :description, :point, :state
  json.url task_url(task, format: :json)
end
