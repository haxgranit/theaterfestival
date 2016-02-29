require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @another_user = User.new(email: 'throwaway@example.com', first_name: 'Throwaway', last_name: 'Tester', location: 'Nowhere', time_zone: 'UTC', password_digest: BCrypt::Password.create('secret'))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: @another_user.email, first_name: @user.first_name, last_name: @user.last_name, location: @user.location, password: 'secret', password_confirmation: 'secret', time_zone: @user.time_zone }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { email: @user.email, first_name: @user.first_name, last_name: @user.last_name, location: @user.location, password: 'secret', password_confirmation: 'secret', time_zone: @user.time_zone }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
