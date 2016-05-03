require 'test_helper'

class ProductionMetadataControllerTest < ActionController::TestCase
  setup do
    @production_metadatum = production_metadata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:production_metadata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create production_metadatum" do
    assert_difference('ProductionMetadata.count') do
      post :create, production_metadatum: { info: @production_metadatum.info, info_heading: @production_metadatum.info_heading, intermissions: @production_metadatum.intermissions, performance_type: @production_metadatum.performance_type, production_id: @production_metadatum.production_id, running_time: @production_metadatum.running_time, warning_info: @production_metadatum.warning_info, warnings: @production_metadatum.warnings }
    end

    assert_redirected_to production_metadatum_path(assigns(:production_metadatum))
  end

  test "should show production_metadatum" do
    get :show, id: @production_metadatum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @production_metadatum
    assert_response :success
  end

  test "should update production_metadatum" do
    patch :update, id: @production_metadatum, production_metadatum: { info: @production_metadatum.info, info_heading: @production_metadatum.info_heading, intermissions: @production_metadatum.intermissions, performance_type: @production_metadatum.performance_type, production_id: @production_metadatum.production_id, running_time: @production_metadatum.running_time, warning_info: @production_metadatum.warning_info, warnings: @production_metadatum.warnings }
    assert_redirected_to production_metadatum_path(assigns(:production_metadatum))
  end

  test "should destroy production_metadatum" do
    assert_difference('ProductionMetadata.count', -1) do
      delete :destroy, id: @production_metadatum
    end

    assert_redirected_to production_metadata_index_path
  end
end
