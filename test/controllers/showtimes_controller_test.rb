require 'test_helper'

class ShowtimesControllerTest < ActionController::TestCase
  setup do
    @showtime = showtimes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:showtimes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create showtime" do
    assert_difference('Showtime.count') do
      post :create, showtime: { showtime: @showtime.showtime, theater_id: @showtime.theater_id }
    end

    assert_redirected_to showtime_path(assigns(:showtime))
  end

  test "should show showtime" do
    get :show, id: @showtime
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @showtime
    assert_response :success
  end

  test "should update showtime" do
    patch :update, id: @showtime, showtime: { showtime: @showtime.showtime, theater_id: @showtime.theater_id }
    assert_redirected_to showtime_path(assigns(:showtime))
  end

  test "should destroy showtime" do
    assert_difference('Showtime.count', -1) do
      delete :destroy, id: @showtime
    end

    assert_redirected_to showtimes_path
  end
end
