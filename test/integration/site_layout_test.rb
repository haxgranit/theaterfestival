require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template "static/home"
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", signup_path

    get signup_path
    assert_template "users/new"
    assert_select "title", default_title("Signup")
  end
end
