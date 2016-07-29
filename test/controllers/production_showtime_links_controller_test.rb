require 'test_helper'

class ProductionShowtimeLinksControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  setup do
    @production_showtime_link = production_showtime_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:production_showtime_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create production_showtime_link" do
    assert_difference('ProductionShowtimeLink.count') do
      post :create, production_showtime_link: { production_id: @production_showtime_link.production_id, showtime_id: @production_showtime_link.showtime_id }
    end

    assert_redirected_to production_showtime_link_path(assigns(:production_showtime_link))
  end

  test "should show production_showtime_link" do
    get :show, id: @production_showtime_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @production_showtime_link
    assert_response :success
  end

  test "should update production_showtime_link" do
    patch :update, id: @production_showtime_link, production_showtime_link: { production_id: @production_showtime_link.production_id, showtime_id: @production_showtime_link.showtime_id }
    assert_redirected_to production_showtime_link_path(assigns(:production_showtime_link))
  end

  test "should destroy production_showtime_link" do
    assert_difference('ProductionShowtimeLink.count', -1) do
      delete :destroy, id: @production_showtime_link
    end

    assert_redirected_to production_showtime_links_path
  end
end
