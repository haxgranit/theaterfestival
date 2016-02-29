require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup" do
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, user: { first_name: '',
                                last_name: '',
                                email: 'invalid@example',
                                password: 'foo',
                                password_confirmation: 'bar',
                                time_zone: 'fake' }
    end
    assert_template 'users/new'
    assert_select 'span.help-block'
    assert_select '.form-group.has-error'
  end

  test "valid signup" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect signup_path, user: { first_name: 'Valid',
                                             last_name: 'User',
                                             email: 'valid@example.com',
                                             password: 'password',
                                             password_confirmation: 'password',
                                             time_zone: 'UTC' }
    end
    assert_template 'users/show'
    assert_not flash.empty?
    assert is_logged_in?
  end
end
