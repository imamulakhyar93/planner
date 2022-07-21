# frozen_string_literal: true

module RenderingHelper
  SERVER_ERROR_MESSAGES = 'Server internal error, please try again later.'
  # http_status_code follows :status option for ActionController::Base#render method
  def render_errors(messages, http_status_code)
    messages = [messages] unless messages.is_a? Array
    render json: { errors: messages }, status: http_status_code
  end

  # custom rendering error that uses render_errors
  def render_authentication_errors(messages = ['Authentication failed: invalid credentials'])
    render_errors(messages, :unauthorized)
  end

  def render_authorization_errors(messages = ['Authorization failed: you do not have permission to view/edit this resource'])
    render_errors(messages, :forbidden)
  end

  def render_not_found_errors(messages = ['Resource(s) specified cannot be found'])
    render_errors(messages, :not_found)
  end

  def render_parameter_errors(messages = ['One or more required fields submitted is empty'])
    render_errors(messages, :bad_request)
  end

  def render_validation_errors(messages = ['Validations failed: please resubmit with the correct fields'])
    # logger.debug 'Validation Error: the error messages as follows:'
    # logger.debug messages.full_messages.to_sentence
    render_errors(messages, :unprocessable_entity)
  end

  def render_server_errors(messages = nil, error_code = nil)
    messages = SERVER_ERROR_MESSAGES if messages.nil?
    messages = "#{messages} Code: #{error_code}" unless error_code.nil?
    render_errors(messages, :internal_server_error)
  end
end
