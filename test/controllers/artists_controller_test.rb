require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  setup do
    @artist = artists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artist" do
    assert_difference('Artist.count') do
      post :create, artist: { birth_location: @artist.birth_location, birthdate: @artist.birthdate, education: @artist.education, stage_name: @artist.stage_name, full_bio: @artist.full_bio, hometown: @artist.hometown, title: @artist.title, user_id: @artist.user_id }
    end

    assert_redirected_to artist_path(assigns(:artist))
  end

  test "should show artist" do
    get :show, id: @artist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artist
    assert_response :success
  end

  test "should update artist" do
    patch :update, id: @artist, artist: { birth_location: @artist.birth_location, birthdate: @artist.birthdate, education: @artist.education, stage_name: @artist.stage_name, full_bio: @artist.full_bio, hometown: @artist.hometown, title: @artist.title, user_id: @artist.user_id }
    assert_redirected_to artist_path(assigns(:artist))
  end

  test "should destroy artist" do
    assert_difference('Artist.count', -1) do
      delete :destroy, id: @artist
    end

    assert_redirected_to artists_path
  end
end
