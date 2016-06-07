require 'test_helper'

class CompanySocialMetadataControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @company_social_metadata = company_social_metadata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_social_metadata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_social_metadata" do
    assert_difference('CompanySocialMetadata.count') do
      post :create, company_social_metadata: { artist_id: @company_social_metadata.artist_id, email: @company_social_metadata.email, facebook: @company_social_metadata.facebook, instagram: @company_social_metadata.instagram, linkedin: @company_social_metadata.linkedin, snapchat: @company_social_metadata.snapchat, tumblr: @company_social_metadata.tumblr, twitter: @company_social_metadata.twitter, vine: @company_social_metadata.vine, website: @company_social_metadata.website }
    end

    assert_redirected_to company_social_metadata_path(assigns(:company_social_metadata))
  end

  test "should show company_social_metadata" do
    get :show, id: @company_social_metadata
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_social_metadata
    assert_response :success
  end

  test "should update company_social_metadata" do
    patch :update, id: @company_social_metadata, company_social_metadata: { artist_id: @company_social_metadata.artist_id, email: @company_social_metadata.email, facebook: @company_social_metadata.facebook, instagram: @company_social_metadata.instagram, linkedin: @company_social_metadata.linkedin, snapchat: @company_social_metadata.snapchat, tumblr: @company_social_metadata.tumblr, twitter: @company_social_metadata.twitter, vine: @company_social_metadata.vine, website: @company_social_metadata.website }
    assert_redirected_to company_social_metadata_path(assigns(:company_social_metadata))
  end

  test "should destroy company_social_metadata" do
    assert_difference('CompanySocialMetadata.count', -1) do
      delete :destroy, id: @company_social_metadata
    end

    assert_redirected_to company_social_metadata_index_path
  end
end
