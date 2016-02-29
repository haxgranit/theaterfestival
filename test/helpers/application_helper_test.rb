require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "default title sanity check" do
    assert_equal default_title, 'TheaterEngine'
    assert_equal default_title('Test'), 'TheaterEngine | Test'
  end
end
