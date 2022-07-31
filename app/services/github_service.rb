class GithubService
  attr_reader :client, :client_id, :client_secret

  def initialize(client_id, client_secret=nil)
    @client = client_secret == nil ? Octokit::Client.new(:access_token=>client_id): Octokit::Client.new(:client_id=>client_id, :client_secret=>client_secret)
    @client_id = client_id
    @client_secret = client_secret
  end

  def token(code, state,host)
    token = client.exchange_code_for_token(code,client_id,client_secret,{:state=>state})
    token_format = {
      :access_token => token.access_token,
      :token_type => token.token_type,
      :scope => token.scope,
      :id_token => CryptoService.id_token(host),
    }

    token_format
  end

  def login_url
    client.authorize_url(client_id,{:scope=>'read:user,user:email',:response_type=>'code',:redirect_uri=>'http://localhost:3000/github/token'})
  end

  def userinfo
    user = client.user()
    user_format = {
      :id => user.id,
      :login => user.login,
      :name => user.name,
      :email => user.email,
    }

    user_format
  end

end
