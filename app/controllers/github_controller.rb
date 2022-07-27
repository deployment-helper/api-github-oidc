
class GithubController < ApplicationController
  def token

  end

  def login_url
    url = "#{Rails.configuration.x.github[:url]}/login/oauth/authorize?client_id=#{Rails.configuration.x.github[:client_id]}"
    render json: { url: url }
  end
end
