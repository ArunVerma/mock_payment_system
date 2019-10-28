# frozen_string_literal: true

# API controller to have common stuffs
class Api::V1::ApiController < ActionController::Base
  # skip_before_action :verify_authenticity_token
  protect_from_forgery unless: -> { request.format.json? }
  # respond_to :json
end
