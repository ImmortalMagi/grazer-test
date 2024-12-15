require "test_helper"

class PreferenceTest < ActiveSupport::TestCase
  test "should not save a preference without valid params" do
    preference = Preference.new
    assert_not preference.valid?, "Valid preference without params"
  end

  test "should save a preference with valid params" do
    preference = Preference.new(user: User.find(10), looking_for_diet_type: "Vegan", lower_age: 20, upper_age: 30, distance: 5.1, gender: "Female")
    assert preference.valid?, "Invalid preference which should be valid"
  end

  test "should be able to find prefences for a user" do
    user = User.find(10)
    assert user.valid?, "Can't find user"
    preference = Preference.new(user: user, looking_for_diet_type: "Vegan", lower_age: 20, upper_age: 30, distance: 5.1, gender: "Female")
    preference.save
    assert_equal user.preference, preference, "Mismatch with preference"
  end

  test "should overwrite user preference if already created" do
    user = User.find(10)
    assert user.valid?, "Can't find user"
    preference = Preference.new(user: user, looking_for_diet_type: "Vegan", lower_age: 20, upper_age: 30, distance: 5.1, gender: "Female")
    preference.save
    preference2 = Preference.new(user: user, looking_for_diet_type: "Vegan", lower_age: 30, upper_age: 35, distance: 5.1, gender: "All")
    preference2.save
    assert_equal user.preference, preference2, "Not overwriting preference"
  end
end