require 'jwt'

class JwtAuthentication
  def self.generate_jwt(user_id)
    payload = {exp: 2.hours.from_now.to_i, usr: user_id}
    secret = Rails.application.secrets.secret_key_base
    JWT.encode payload, secret, 'HS256'
  end

  def self.decode_jwt(jwt)
    JWT.decode(jwt, Rails.application.secrets.secret_key_base)
  end
end