class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  skip_before_action :verify_authenticity_token
  before_action :check_request_format

  private

  def check_request_format
    (render status: 406, json: { error: "Format should be JSON" }) if request.format != :json
  end
  
end
