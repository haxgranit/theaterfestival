require 'test_helper'

class CompanyProductionLinksControllerTest < ActionController::TestCase
  setup do
    @company_production_link = company_production_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_production_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_production_link" do
    assert_difference('CompanyProductionLink.count') do
      post :create, company_production_link: { company_id: @company_production_link.company_id, production_id: @company_production_link.production_id }
    end

    assert_redirected_to company_production_link_path(assigns(:company_production_link))
  end

  test "should show company_production_link" do
    get :show, id: @company_production_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_production_link
    assert_response :success
  end

  test "should update company_production_link" do
    patch :update, id: @company_production_link, company_production_link: { company_id: @company_production_link.company_id, production_id: @company_production_link.production_id }
    assert_redirected_to company_production_link_path(assigns(:company_production_link))
  end

  test "should destroy company_production_link" do
    assert_difference('CompanyProductionLink.count', -1) do
      delete :destroy, id: @company_production_link
    end

    assert_redirected_to company_production_links_path
  end
end
