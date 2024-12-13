require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save a user without valid params" do
    user = User.new
    assert_not user.save, "Saved user without params"
  end
end
