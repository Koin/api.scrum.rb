class ApiController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  respond_to :json

  before_filter do
    request.format = :json
    response.headers["API"] = "v1"
  end

  def record_not_found
    head :not_found
  end
end
