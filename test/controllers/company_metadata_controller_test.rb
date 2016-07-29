require 'test_helper'

class CompanyMetadataControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  setup do
    @company_metadata = company_metadata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_metadata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_metadata" do
    assert_difference('CompanyMetadata.count') do
      post :create, company_metadata: { address1: @company_metadata.address1, address2: @company_metadata.address2, company_id: @company_metadata.company_id, date_founded: @company_metadata.date_founded, founders: @company_metadata.founders, history: @company_metadata.history, location_founded: @company_metadata.location_founded, mission: @company_metadata.mission }
    end

    assert_redirected_to company_metadata_path(assigns(:company_metadata))
  end

  test "should show company_metadata" do
    get :show, id: @company_metadata
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_metadata
    assert_response :success
  end

  test "should update company_metadata" do
    patch :update, id: @company_metadata, company_metadata: { address1: @company_metadata.address1, address2: @company_metadata.address2, company_id: @company_metadata.company_id, date_founded: @company_metadata.date_founded, founders: @company_metadata.founders, history: @company_metadata.history, location_founded: @company_metadata.location_founded, mission: @company_metadata.mission }
    assert_redirected_to company_metadata_path(assigns(:company_metadata))
  end

  test "should destroy company_metadata" do
    assert_difference('CompanyMetadata.count', -1) do
      delete :destroy, id: @company_metadata
    end

    assert_redirected_to company_metadata_index_path
  end
end
