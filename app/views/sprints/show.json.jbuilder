json.extract! @sprint, :id, :start_date, :end_date, :state, :created_at, :updated_at
json.product_url product_url(@sprint.product, format: :json)
