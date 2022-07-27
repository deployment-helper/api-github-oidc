require "test_helper"

class HealthControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/health'
    assert_response :success
  end

  test "should get default" do
    get '/'
    assert_response :success
  end
end
