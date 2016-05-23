require 'test_helper'

class ArtistSocialMetadataControllerTest < ActionController::TestCase
  setup do
    @artist_social_metadata = artist_social_metadata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artist_social_metadata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artist_social_metadata" do
    assert_difference('ArtistSocialMetadata.count') do
      post :create, artist_social_metadata: { artist_id: @artist_social_metadata.artist_id, email: @artist_social_metadata.email, facebook: @artist_social_metadata.facebook, instagram: @artist_social_metadata.instagram, linkedin: @artist_social_metadata.linkedin, snapchat: @artist_social_metadata.snapchat, tumblr: @artist_social_metadata.tumblr, twitter: @artist_social_metadata.twitter, vine: @artist_social_metadata.vine, website: @artist_social_metadata.website }
    end

    assert_redirected_to artist_social_metadata_path(assigns(:artist_social_metadata))
  end

  test "should show artist_social_metadata" do
    get :show, id: @artist_social_metadata
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artist_social_metadata
    assert_response :success
  end

  test "should update artist_social_metadata" do
    patch :update, id: @artist_social_metadata, artist_social_metadata: { artist_id: @artist_social_metadata.artist_id, email: @artist_social_metadata.email, facebook: @artist_social_metadata.facebook, instagram: @artist_social_metadata.instagram, linkedin: @artist_social_metadata.linkedin, snapchat: @artist_social_metadata.snapchat, tumblr: @artist_social_metadata.tumblr, twitter: @artist_social_metadata.twitter, vine: @artist_social_metadata.vine, website: @artist_social_metadata.website }
    assert_redirected_to artist_social_metadata_path(assigns(:artist_social_metadata))
  end

  test "should destroy artist_social_metadata" do
    assert_difference('ArtistSocialMetadata.count', -1) do
      delete :destroy, id: @artist_social_metadata
    end

    assert_redirected_to artist_social_metadata_index_path
  end
end
