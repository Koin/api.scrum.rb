json.array!(@stories) do |story|
  json.extract! story, :label, :description, :point, :functional_point, :state, :product_id
  json.url product_story_url(@product, story, format: :json)
end
