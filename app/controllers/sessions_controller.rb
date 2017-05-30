require 'jwt_authentication'

class SessionsController < ApplicationController
  def create
    user = authenticate
    if user
      jwt = JwtAuthentication.generate_jwt(user.id)
      render body: jwt, status: :created
    else
      render status: :bad_request
    end
  end

  private
  def authenticate
    auth_header = request.headers['Authorization']
    if auth_header.nil?
      render status: :bad_request
    else
      auth_header_value = auth_header.split(' ')
      if auth_header_value.first.eql? 'Basic'
        credentials = URI.unescape auth_header_value.last
        credential_array = credentials.split ':'
        email = credential_array.first
        password = credential_array.last
        User.find_by(email: email).try(:authenticate, password)
      end
    end
  end
end
