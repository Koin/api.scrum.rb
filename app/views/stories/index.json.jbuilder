json.array!(@stories) do |story|
  json.extract! story,
    :label,
    :description,
    :technical_point,
    :functional_point,
    :state
  json.url product_story_url(@product, story, format: :json)
end
