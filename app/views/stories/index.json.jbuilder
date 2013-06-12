json.array!(@stories) do |story|
  json.extract! story, :id, :label, :description, :technical_point, :functional_point, :state
  json.url story_url(story, format: :json)
end
