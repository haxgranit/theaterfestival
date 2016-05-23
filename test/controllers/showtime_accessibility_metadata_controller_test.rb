require 'test_helper'

class ShowtimeAccessibilityMetadataControllerTest < ActionController::TestCase
  setup do
    @showtime_accessibility_metadata = showtime_accessibility_metadata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:showtime_accessibility_metadata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create showtime_accessibility_metadata" do
    assert_difference('ShowtimeAccessibilityMetadata.count') do
      post :create, showtime_accessibility_metadata: { guide_dogs: @showtime_accessibility_metadata.guide_dogs, guide_dogs_info: @showtime_accessibility_metadata.guide_dogs_info, hearing_devices: @showtime_accessibility_metadata.hearing_devices, hearing_devices_info: @showtime_accessibility_metadata.hearing_devices_info, seat_capacity: @showtime_accessibility_metadata.seat_capacity, translation_devices: @showtime_accessibility_metadata.translation_devices, translation_devices_info: @showtime_accessibility_metadata.translation_devices_info, wheelchair_accessible: @showtime_accessibility_metadata.wheelchair_accessible, wheelchair_accessible_info: @showtime_accessibility_metadata.wheelchair_accessible_info }
    end

    assert_redirected_to showtime_accessibility_metadata_path(assigns(:showtime_accessibility_metadata))
  end

  test "should show showtime_accessibility_metadata" do
    get :show, id: @showtime_accessibility_metadata
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @showtime_accessibility_metadata
    assert_response :success
  end

  test "should update showtime_accessibility_metadata" do
    patch :update, id: @showtime_accessibility_metadata, showtime_accessibility_metadata: { guide_dogs: @showtime_accessibility_metadata.guide_dogs, guide_dogs_info: @showtime_accessibility_metadata.guide_dogs_info, hearing_devices: @showtime_accessibility_metadata.hearing_devices, hearing_devices_info: @showtime_accessibility_metadata.hearing_devices_info, seat_capacity: @showtime_accessibility_metadata.seat_capacity, translation_devices: @showtime_accessibility_metadata.translation_devices, translation_devices_info: @showtime_accessibility_metadata.translation_devices_info, wheelchair_accessible: @showtime_accessibility_metadata.wheelchair_accessible, wheelchair_accessible_info: @showtime_accessibility_metadata.wheelchair_accessible_info }
    assert_redirected_to showtime_accessibility_metadata_path(assigns(:showtime_accessibility_metadata))
  end

  test "should destroy showtime_accessibility_metadata" do
    assert_difference('ShowtimeAccessibilityMetadata.count', -1) do
      delete :destroy, id: @showtime_accessibility_metadata
    end

    assert_redirected_to showtime_accessibility_metadata_index_path
  end
end
