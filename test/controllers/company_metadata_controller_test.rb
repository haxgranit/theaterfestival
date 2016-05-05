require 'test_helper'

class CompanyMetadataControllerTest < ActionController::TestCase
  setup do
    @company_metadatum = company_metadata(:one)
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

  test "should create company_metadatum" do
    assert_difference('CompanyMetadata.count') do
      post :create, company_metadatum: { address1: @company_metadatum.address1, address2: @company_metadatum.address2, company_id: @company_metadatum.company_id, date_founded: @company_metadatum.date_founded, founders: @company_metadatum.founders, history: @company_metadatum.history, location_founded: @company_metadatum.location_founded, mission: @company_metadatum.mission }
    end

    assert_redirected_to company_metadatum_path(assigns(:company_metadatum))
  end

  test "should show company_metadatum" do
    get :show, id: @company_metadatum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_metadatum
    assert_response :success
  end

  test "should update company_metadatum" do
    patch :update, id: @company_metadatum, company_metadatum: { address1: @company_metadatum.address1, address2: @company_metadatum.address2, company_id: @company_metadatum.company_id, date_founded: @company_metadatum.date_founded, founders: @company_metadatum.founders, history: @company_metadatum.history, location_founded: @company_metadatum.location_founded, mission: @company_metadatum.mission }
    assert_redirected_to company_metadatum_path(assigns(:company_metadatum))
  end

  test "should destroy company_metadatum" do
    assert_difference('CompanyMetadata.count', -1) do
      delete :destroy, id: @company_metadatum
    end

    assert_redirected_to company_metadata_index_path
  end
end
