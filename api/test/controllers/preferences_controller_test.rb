require "test_helper"

class PreferencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    preferences_index_url = "/preferences"
    get preferences_index_url
    assert_response :success
  end

  test "should get preference" do
    preferences_show_url = "/preferences/10"
    get preferences_show_url
    assert_response :success
    response_json = JSON.parse(response.body)
    assert_equal 10, response_json["id"]
    assert_equal 249, response_json["user_id"]
    assert_equal "Vegan", response_json["looking_for_diet_type"]
    assert_equal 20, response_json["lower_age"]
    assert_equal 30, response_json["upper_age"]
    assert_equal "5.0", response_json["distance"]
    assert_equal "Male", response_json["gender"]
  end

  test "should create a preference" do
    preferences_create_url = "/preferences?preference[user_id]=249&preference[looking_for_diet_type]=Vegan&preference[lower_age]=20&preference[upper_age]=40&preference[distance]=6.8&preference[gender]=Male"
    post preferences_create_url
    assert_response :success
  end
end
