require "test_helper"

class GithubControllerTest < ActionDispatch::IntegrationTest
  test "should get token" do
    get github_token_url
    assert_response :success
  end
end
