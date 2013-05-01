json.extract! @story,
  :label,
  :description,
  :technical_point,
  :functional_point,
  :state,
  :created_at,
  :updated_at
json.product_url product_url(@product, format: :json)
