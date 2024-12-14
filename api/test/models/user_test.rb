require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save a user without valid params" do
    user = User.new
    assert_not user.valid?, "Valid user without params"
  end

  test "should save a user with valid params" do
    user = User.new(name: "Tim", gender: "NB", locationX: 1.1, locationY: 3.6, diet_type: "Omnivore", age: 43)
    assert user.valid?, "Invalid user which should be valid"
  end
end
