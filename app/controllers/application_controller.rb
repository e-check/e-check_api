require 'jwt'
require 'jwt_authentication'

class ApplicationController < ActionController::API
  def authenticate_user_from_jwt
    jwt = jwt_from_header
    if jwt
      begin
        decoded_jwt = JwtAuthentication.decode_jwt(jwt)
        @current_user_id = decoded_jwt[0]['usr']
      rescue JWT::DecodeError => exception
        render text: exception.message, status: :unauthorized
      end
    else
      render status: :unauthorized
    end
  end

  def jwt_from_header
    auth_header = request.headers['Authorization']
    unless auth_header.nil?
      auth_header_value = auth_header.split(' ')
      auth_header_value.last if auth_header_value.first.eql? 'Bearer'
    end
  end

  def render_bad_request (error_code)
    error_message = I18n.t error_code
    body = {error_code: error_code, error_message: error_message}
    render json: body, status: :bad_request
  end
end
