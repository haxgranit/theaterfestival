require 'test_helper'

class ShowtimeTicketMetadataControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @showtime_ticket_metadata = showtime_ticket_metadata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:showtime_ticket_metadata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create showtime_ticket_metadata" do
    assert_difference('ShowtimeTicketMetadata.count') do
      post :create, showtime_ticket_metadata: { additional_ticket_type: @showtime_ticket_metadata.additional_ticket_type, additional_ticket_type_info: @showtime_ticket_metadata.additional_ticket_type_info, additional_ticket_type_price: @showtime_ticket_metadata.additional_ticket_type_price, guaranteed_price: @showtime_ticket_metadata.guaranteed_price, guaranteed_price_note: @showtime_ticket_metadata.guaranteed_price_note, in_person_ticketing_info: @showtime_ticket_metadata.in_person_ticketing_info, notes: @showtime_ticket_metadata.notes, reservation_link: @showtime_ticket_metadata.reservation_link, reservation_link_info: @showtime_ticket_metadata.reservation_link_info, reservation_phone: @showtime_ticket_metadata.reservation_phone, reservation_phone_info: @showtime_ticket_metadata.reservation_phone_info, special_event: @showtime_ticket_metadata.special_event, special_event_info: @showtime_ticket_metadata.special_event_info, ticket_link: @showtime_ticket_metadata.ticket_link }
    end

    assert_redirected_to showtime_ticket_metadata_path(assigns(:showtime_ticket_metadata))
  end

  test "should show showtime_ticket_metadata" do
    get :show, id: @showtime_ticket_metadata
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @showtime_ticket_metadata
    assert_response :success
  end

  test "should update showtime_ticket_metadata" do
    patch :update, id: @showtime_ticket_metadata, showtime_ticket_metadata: { additional_ticket_type: @showtime_ticket_metadata.additional_ticket_type, additional_ticket_type_info: @showtime_ticket_metadata.additional_ticket_type_info, additional_ticket_type_price: @showtime_ticket_metadata.additional_ticket_type_price, guaranteed_price: @showtime_ticket_metadata.guaranteed_price, guaranteed_price_note: @showtime_ticket_metadata.guaranteed_price_note, in_person_ticketing_info: @showtime_ticket_metadata.in_person_ticketing_info, notes: @showtime_ticket_metadata.notes, reservation_link: @showtime_ticket_metadata.reservation_link, reservation_link_info: @showtime_ticket_metadata.reservation_link_info, reservation_phone: @showtime_ticket_metadata.reservation_phone, reservation_phone_info: @showtime_ticket_metadata.reservation_phone_info, special_event: @showtime_ticket_metadata.special_event, special_event_info: @showtime_ticket_metadata.special_event_info, ticket_link: @showtime_ticket_metadata.ticket_link }
    assert_redirected_to showtime_ticket_metadata_path(assigns(:showtime_ticket_metadata))
  end

  test "should destroy showtime_ticket_metadata" do
    assert_difference('ShowtimeTicketMetadata.count', -1) do
      delete :destroy, id: @showtime_ticket_metadata
    end

    assert_redirected_to showtime_ticket_metadata_index_path
  end
end
