json.array!(@products) do |product|
  json.extract! product, :label, :description
  json.url product_url(product, format: :json)
end
