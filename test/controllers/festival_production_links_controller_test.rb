require 'test_helper'

class FestivalProductionLinksControllerTest < ActionController::TestCase
  setup do
    @festival_production_link = festival_production_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:festival_production_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create festival_production_link" do
    assert_difference('FestivalProductionLink.count') do
      post :create, festival_production_link: { festival_id: @festival_production_link.festival_id, production_id: @festival_production_link.production_id }
    end

    assert_redirected_to festival_production_link_path(assigns(:festival_production_link))
  end

  test "should show festival_production_link" do
    get :show, id: @festival_production_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @festival_production_link
    assert_response :success
  end

  test "should update festival_production_link" do
    patch :update, id: @festival_production_link, festival_production_link: { festival_id: @festival_production_link.festival_id, production_id: @festival_production_link.production_id }
    assert_redirected_to festival_production_link_path(assigns(:festival_production_link))
  end

  test "should destroy festival_production_link" do
    assert_difference('FestivalProductionLink.count', -1) do
      delete :destroy, id: @festival_production_link
    end

    assert_redirected_to festival_production_links_path
  end
end
