require 'test_helper'

class TheaterMetadataControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @theater_metadata = theater_metadata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:theater_metadata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create theater_metadata" do
    assert_difference('TheaterMetadata.count') do
      post :create, theater_metadata: { guide_dogs: @theater_metadata.guide_dogs, guide_dogs_info: @theater_metadata.guide_dogs_info, hearing_devices: @theater_metadata.hearing_devices, hearing_devices_info: @theater_metadata.hearing_devices_info, seat_capacity: @theater_metadata.seat_capacity, theater_id: @theater_metadata.theater_id, translation_devices: @theater_metadata.translation_devices, translation_devices_info: @theater_metadata.translation_devices_info, wheelchair_accessible: @theater_metadata.wheelchair_accessible, wheelchair_accessible_info: @theater_metadata.wheelchair_accessible_info }
    end

    assert_redirected_to theater_metadata_path(assigns(:theater_metadata))
  end

  test "should show theater_metadata" do
    get :show, id: @theater_metadata
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @theater_metadata
    assert_response :success
  end

  test "should update theater_metadata" do
    patch :update, id: @theater_metadata, theater_metadata: { guide_dogs: @theater_metadata.guide_dogs, guide_dogs_info: @theater_metadata.guide_dogs_info, hearing_devices: @theater_metadata.hearing_devices, hearing_devices_info: @theater_metadata.hearing_devices_info, seat_capacity: @theater_metadata.seat_capacity, theater_id: @theater_metadata.theater_id, translation_devices: @theater_metadata.translation_devices, translation_devices_info: @theater_metadata.translation_devices_info, wheelchair_accessible: @theater_metadata.wheelchair_accessible, wheelchair_accessible_info: @theater_metadata.wheelchair_accessible_info }
    assert_redirected_to theater_metadata_path(assigns(:theater_metadata))
  end

  test "should destroy theater_metadata" do
    assert_difference('TheaterMetadata.count', -1) do
      delete :destroy, id: @theater_metadata
    end

    assert_redirected_to theater_metadata_index_path
  end
end
