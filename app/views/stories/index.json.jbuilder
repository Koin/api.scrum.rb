json.array!(@stories) do |story|
  json.extract! story, :label, :description, :point, :functional_point, :state, :product_id
  json.url story_url(story, format: :json)
end