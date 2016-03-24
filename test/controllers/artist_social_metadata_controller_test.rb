require 'test_helper'

class ArtistSocialMetadataControllerTest < ActionController::TestCase
  setup do
    @artist_social_metadatum = artist_social_metadata(:one)
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

  test "should create artist_social_metadatum" do
    assert_difference('ArtistSocialMetadata.count') do
      post :create, artist_social_metadatum: { artist_id: @artist_social_metadatum.artist_id, email: @artist_social_metadatum.email, facebook: @artist_social_metadatum.facebook, instagram: @artist_social_metadatum.instagram, linkedin: @artist_social_metadatum.linkedin, snapchat: @artist_social_metadatum.snapchat, tumblr: @artist_social_metadatum.tumblr, twitter: @artist_social_metadatum.twitter, vine: @artist_social_metadatum.vine, website: @artist_social_metadatum.website }
    end

    assert_redirected_to artist_social_metadatum_path(assigns(:artist_social_metadatum))
  end

  test "should show artist_social_metadatum" do
    get :show, id: @artist_social_metadatum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artist_social_metadatum
    assert_response :success
  end

  test "should update artist_social_metadatum" do
    patch :update, id: @artist_social_metadatum, artist_social_metadatum: { artist_id: @artist_social_metadatum.artist_id, email: @artist_social_metadatum.email, facebook: @artist_social_metadatum.facebook, instagram: @artist_social_metadatum.instagram, linkedin: @artist_social_metadatum.linkedin, snapchat: @artist_social_metadatum.snapchat, tumblr: @artist_social_metadatum.tumblr, twitter: @artist_social_metadatum.twitter, vine: @artist_social_metadatum.vine, website: @artist_social_metadatum.website }
    assert_redirected_to artist_social_metadatum_path(assigns(:artist_social_metadatum))
  end

  test "should destroy artist_social_metadatum" do
    assert_difference('ArtistSocialMetadata.count', -1) do
      delete :destroy, id: @artist_social_metadatum
    end

    assert_redirected_to artist_social_metadata_index_path
  end
end
