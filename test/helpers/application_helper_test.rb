require 'test_helper'

class ApplicationHelperText < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "Commute Tracker"
    assert_equal full_title("Help"), "Help | Commute Tracker"
  end
end