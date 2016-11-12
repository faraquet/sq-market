class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  skip_before_action :verify_authenticity_token
  before_action :check_request_format

  private

  def record_not_found
    render status: 404, json: { error: "Record not found" }
  end

  def check_request_format
    (render status: 406, json: { error: "Format should be JSON" }) if request.format != :json
  end
  
end
