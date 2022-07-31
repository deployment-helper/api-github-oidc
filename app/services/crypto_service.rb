class CryptoService
  def CryptoService.get_jwk
    jwk = JWT::JWK.new(Rails.configuration.x.rsa_public)
    jwk
  end

  def CryptoService.get_publicKey
    jwk = CryptoService.get_jwk
    full_jwk = {
      'alg':'RS256'
    }
    full_jwk.merge!(jwk.export)
  end

  def CryptoService.id_token(host)
    jwt = JWT.encode({
      iss: "https://#{host}",
      sub: Rails.configuration.x.github.jwt_subject,
      aud: Rails.configuration.x.github.client_id.to_s,
      exp: Time.now.to_i + 3600,
      iat: Time.now.to_i
    }, Rails.configuration.x.rsa_private, 'RS256', {kid: CryptoService.get_jwk.kid})
    return jwt
  end
end
