class HealthController < ApplicationController
  def index
    render json:"OK"
  end

  def under_development
    render json: 'Application is running....'
  end
end
