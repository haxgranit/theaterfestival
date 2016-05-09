require 'test_helper'

class TheaterMetadataControllerTest < ActionController::TestCase
  setup do
    @theater_metadatum = theater_metadata(:one)
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

  test "should create theater_metadatum" do
    assert_difference('TheaterMetadata.count') do
      post :create, theater_metadatum: { guide_dogs: @theater_metadatum.guide_dogs, guide_dogs_info: @theater_metadatum.guide_dogs_info, hearing_devices: @theater_metadatum.hearing_devices, hearing_devices_info: @theater_metadatum.hearing_devices_info, seat_capacity: @theater_metadatum.seat_capacity, theater_id: @theater_metadatum.theater_id, translation_devices: @theater_metadatum.translation_devices, translation_devices_info: @theater_metadatum.translation_devices_info, wheelchair_accessible: @theater_metadatum.wheelchair_accessible, wheelchair_accessible_info: @theater_metadatum.wheelchair_accessible_info }
    end

    assert_redirected_to theater_metadatum_path(assigns(:theater_metadatum))
  end

  test "should show theater_metadatum" do
    get :show, id: @theater_metadatum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @theater_metadatum
    assert_response :success
  end

  test "should update theater_metadatum" do
    patch :update, id: @theater_metadatum, theater_metadatum: { guide_dogs: @theater_metadatum.guide_dogs, guide_dogs_info: @theater_metadatum.guide_dogs_info, hearing_devices: @theater_metadatum.hearing_devices, hearing_devices_info: @theater_metadatum.hearing_devices_info, seat_capacity: @theater_metadatum.seat_capacity, theater_id: @theater_metadatum.theater_id, translation_devices: @theater_metadatum.translation_devices, translation_devices_info: @theater_metadatum.translation_devices_info, wheelchair_accessible: @theater_metadatum.wheelchair_accessible, wheelchair_accessible_info: @theater_metadatum.wheelchair_accessible_info }
    assert_redirected_to theater_metadatum_path(assigns(:theater_metadatum))
  end

  test "should destroy theater_metadatum" do
    assert_difference('TheaterMetadata.count', -1) do
      delete :destroy, id: @theater_metadatum
    end

    assert_redirected_to theater_metadata_index_path
  end
end
