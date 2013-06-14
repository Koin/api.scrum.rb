json.extract! @story, :id, :label, :description, :technical_point, :functional_point, :state, :order, :created_at, :updated_at
json.product_url product_url(@story.product, format: :json)
