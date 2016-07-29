require 'test_helper'

class ProductionMetadataControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  setup do
    @production_metadata = production_metadata(:one)
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

  test "should create production_metadata" do
    assert_difference('ProductionMetadata.count') do
      post :create, production_metadata: { info: @production_metadata.info, info_heading: @production_metadata.info_heading, intermissions: @production_metadata.intermissions, performance_type: @production_metadata.performance_type, production_id: @production_metadata.production_id, running_time: @production_metadata.running_time, warning_info: @production_metadata.warning_info, warnings: @production_metadata.warnings }
    end

    assert_redirected_to production_metadata_path(assigns(:production_metadata))
  end

  test "should show production_metadata" do
    get :show, id: @production_metadata
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @production_metadata
    assert_response :success
  end

  test "should update production_metadata" do
    patch :update, id: @production_metadata, production_metadata: { info: @production_metadata.info, info_heading: @production_metadata.info_heading, intermissions: @production_metadata.intermissions, performance_type: @production_metadata.performance_type, production_id: @production_metadata.production_id, running_time: @production_metadata.running_time, warning_info: @production_metadata.warning_info, warnings: @production_metadata.warnings }
    assert_redirected_to production_metadata_path(assigns(:production_metadata))
  end

  test "should destroy production_metadata" do
    assert_difference('ProductionMetadata.count', -1) do
      delete :destroy, id: @production_metadata
    end

    assert_redirected_to production_metadata_index_path
  end
end
