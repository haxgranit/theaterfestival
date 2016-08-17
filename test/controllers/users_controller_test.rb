require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  setup do
    @user = users(:one)
    @another_user = User.new(email: 'throwaway@example.com', first_name: 'Throwaway', last_name: 'Tester', location: 'Nowhere', time_zone: 'UTC', password: 'super secret pass phrase wonderful')
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

end
