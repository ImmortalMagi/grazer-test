require "test_helper"

class RecommendationsControllerTest < ActionDispatch::IntegrationTest
  test "recommend Steve for Bob" do
    recommendations_url = "/recommendations/249"
    get recommendations_url
    assert_response :success
    response_json = JSON.parse(response.body)
    assert_equal "Steve", response_json[0]["name"]
  end

  test "fail for non-found user" do
    recommendations_url = "/recommendations/2469"
    get recommendations_url
    assert_response :missing
  end

  test "no preferences set for Bob" do
    recommendations_url = "/recommendations/17"
    get recommendations_url
    assert_response :success
  end
end
