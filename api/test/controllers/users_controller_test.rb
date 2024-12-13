require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    users_index_url = "/users"
    get users_index_url
    assert_response :success
  end

  test "should get show" do
    users_show_url = "/users/298486374"
    get users_show_url
    assert_response :success
  end

  test "should create a user" do
    users_create_url = "/users?user[name]=tim&user[gender]=male&user[locationX]=6&user[locationY]=2.4&user[diet_type]=vegan&user[age]=26"
    post users_create_url
    assert_response :success
  end
end
