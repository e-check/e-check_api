class ApplicationController < ActionController::API
  def authenticate_user_from_jwt
    jwt = get_jwt_from_header
    if jwt
      begin
        decoded_jwt = JwtAuthentication.decode_jwt(jwt)
        @current_user_id = decoded_jwt[0]['usr']
      rescue JWT::DecodeError => exception
        render text:exception.message, status: :unauthorized
      end
    else
      render status: :unauthorized
    end
  end

  def get_jwt_from_header
    auth_header = request.headers['Authorization']
    unless auth_header.nil?
      auth_header_value = auth_header.split(' ')
      auth_header_value.last if auth_header_value.first.eql? 'Bearer'
    end
  end
end
