require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    users_index_url = "/users"
    get users_index_url
    assert_response :success
  end

  test "should get user" do
    users_show_url = "/users/10"
    get users_show_url
    assert_response :success
    response_json = JSON.parse(response.body)
    assert_equal 10, response_json["id"]
    assert_equal "Claire", response_json["name"]
    assert_equal "Female", response_json["gender"]
    assert_equal "2.1", response_json["locationX"]
    assert_equal "3.0", response_json["locationY"]
    assert_equal "Omnivore", response_json["diet_type"]
    assert_equal 23, response_json["age"]
  end

  test "should fail to find non-existent user" do
    users_show_url = "/users/1865"
    get users_show_url
    assert_response :missing
  end

  test "should find a user by name" do
    users_search_url = "/users/search?user[name]=Claire"
    get users_search_url
    assert_response :success
    response_json = JSON.parse(response.body)
    assert_equal 10, response_json["id"]
    assert_equal "Claire", response_json["name"]
    assert_equal "Female", response_json["gender"]
    assert_equal "2.1", response_json["locationX"]
    assert_equal "3.0", response_json["locationY"]
    assert_equal "Omnivore", response_json["diet_type"]
    assert_equal 23, response_json["age"]
  end

  test "should find a user by age" do
    users_search_url = "/users/search?user[age]=23"
    get users_search_url
    assert_response :success
    response_json = JSON.parse(response.body)
    assert_equal 10, response_json["id"]
    assert_equal "Claire", response_json["name"]
    assert_equal "Female", response_json["gender"]
    assert_equal "2.1", response_json["locationX"]
    assert_equal "3.0", response_json["locationY"]
    assert_equal "Omnivore", response_json["diet_type"]
    assert_equal 23, response_json["age"]
  end

  test "should find a user by name and age" do
    users_search_url = "/users/search?user[name]=Claire&user[age]=23"
    get users_search_url
    assert_response :success
    response_json = JSON.parse(response.body)
    assert_equal 10, response_json["id"]
    assert_equal "Claire", response_json["name"]
    assert_equal "Female", response_json["gender"]
    assert_equal "2.1", response_json["locationX"]
    assert_equal "3.0", response_json["locationY"]
    assert_equal "Omnivore", response_json["diet_type"]
    assert_equal 23, response_json["age"]
  end

  test "should create a user" do
    users_create_url = "/users?user[name]=tim&user[gender]=male&user[locationX]=6&user[locationY]=2.4&user[diet_type]=vegan&user[age]=26"
    post users_create_url
    assert_response :success
  end
end
