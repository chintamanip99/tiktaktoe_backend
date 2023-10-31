class JwtWrapper
  def self.encode(payload, is_mobile_request: false)

    payload = payload.dup
    payload['jti'] = SecureRandom.uuid
    JWT.encode payload, Rails.application.secret_key_base, 'HS256'
  end

  def self.decode(token)
    begin
      decoded_token = JWT.decode token, Rails.application.secret_key_base, true, { algorithm: 'HS256' }
      decoded_token.first
    rescue
      nil
    end
  end
end
