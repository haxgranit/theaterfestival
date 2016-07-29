require 'test_helper'

class CompanyFestivalLinksControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  setup do
    @company_festival_link = company_festival_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_festival_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_festival_link" do
    assert_difference('CompanyFestivalLink.count') do
      post :create, company_festival_link: { company_id: @company_festival_link.company_id, festival_id: @company_festival_link.festival_id }
    end

    assert_redirected_to company_festival_link_path(assigns(:company_festival_link))
  end

  test "should show company_festival_link" do
    get :show, id: @company_festival_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_festival_link
    assert_response :success
  end

  test "should update company_festival_link" do
    patch :update, id: @company_festival_link, company_festival_link: { company_id: @company_festival_link.company_id, festival_id: @company_festival_link.festival_id }
    assert_redirected_to company_festival_link_path(assigns(:company_festival_link))
  end

  test "should destroy company_festival_link" do
    assert_difference('CompanyFestivalLink.count', -1) do
      delete :destroy, id: @company_festival_link
    end

    assert_redirected_to company_festival_links_path
  end
end
