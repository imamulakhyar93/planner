# frozen_string_literal: true

class ApplicationController < ActionController::API
  include RenderingHelper
  # Read more about auth serialization context:
  # https://github.com/rails-api/active_model_serializers/blob/0-10-stable/docs/general/serializers.md#controller-authorization-context
  serialization_scope :view_context
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_errors

  # Get the current_user from authorization header
  def current_user
    return nil unless token.present?

    decoded = JWT.decode token, nil, false
    return nil unless decoded.first.present?

    user_id = decoded.first['user_id']
    User.find_by_id(user_id)
  rescue JWT::DecodeError => e
    puts 'errors', e
  end

  # Get the token string from headers
  def token
    request.headers['Authorization']
  end

  # Authenticate the user or render the unauthorized error
  def authenticate_user!
    render_authentication_errors unless current_user.present?
  end
end
