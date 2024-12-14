require "test_helper"

class PreferenceTest < ActiveSupport::TestCase
  test "should not save a preference without valid params" do
    preference = Preference.new
    assert_not preference.valid?, "Valid preference without params"
  end

  test "should save a preference with valid params" do
    preference = Preference.new(user: User.find(10), looking_for_diet_type: "vegan", ages: "20-30", distance: 5.1, gender: "female")
    assert preference.valid?, "Invalid preference which should be valid"
  end

  test "should be able to find prefences for a user" do
    user = User.find(10)
    assert user.valid?, "Can't find user"
    preference = Preference.new(user: user, looking_for_diet_type: "vegan", ages: "20-30", distance: 5.1, gender: "female")
    preference.save
    assert_equal user.preferences[0], preference, "Mismatch with preference"
  end
end