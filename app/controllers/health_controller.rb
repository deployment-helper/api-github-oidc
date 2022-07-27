class HealthController < ApplicationController
  def index
    render json:"hello world"
  end

  def under_development
    render json: 'Application is running....'
  end
end
