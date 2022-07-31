
class GithubController < ApplicationController

  def token
    github_service = GithubService.new(Rails.configuration.x.github.client_id.to_s, Rails.configuration.x.github.client_secret)
    token = github_service.token(params['code'], params['state'],request.host)
    render json: token
  end

  def login_url
    github_service = GithubService.new(Rails.configuration.x.github.client_id.to_s, Rails.configuration.x.github.client_secret)
    url = github_service.login_url
    render json: url
  end

  def userinfo
    github_service = GithubService.new(request.headers['Authorization'].split(' ').last)
    userinfo = github_service.userinfo
    render json: userinfo
  end

  def jwks
    jwk = CryptoService.get_publicKey
    jwks = {keys:[jwk]}
    render json: jwks
  end
end
