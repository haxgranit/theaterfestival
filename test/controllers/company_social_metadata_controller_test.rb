require 'test_helper'

class CompanySocialMetadataControllerTest < ActionController::TestCase
  setup do
    @company_social_metadatum = company_social_metadata(:one)
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

  test "should create company_social_metadatum" do
    assert_difference('CompanySocialMetadata.count') do
      post :create, company_social_metadatum: { facebook: @company_social_metadatum.facebook, instagram: @company_social_metadatum.instagram, linkedin: @company_social_metadatum.linkedin, snapchat: @company_social_metadatum.snapchat, tumblr: @company_social_metadatum.tumblr, twitter: @company_social_metadatum.twitter, vine: @company_social_metadatum.vine }
    end

    assert_redirected_to company_social_metadatum_path(assigns(:company_social_metadatum))
  end

  test "should show company_social_metadatum" do
    get :show, id: @company_social_metadatum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_social_metadatum
    assert_response :success
  end

  test "should update company_social_metadatum" do
    patch :update, id: @company_social_metadatum, company_social_metadatum: { facebook: @company_social_metadatum.facebook, instagram: @company_social_metadatum.instagram, linkedin: @company_social_metadatum.linkedin, snapchat: @company_social_metadatum.snapchat, tumblr: @company_social_metadatum.tumblr, twitter: @company_social_metadatum.twitter, vine: @company_social_metadatum.vine }
    assert_redirected_to company_social_metadatum_path(assigns(:company_social_metadatum))
  end

  test "should destroy company_social_metadatum" do
    assert_difference('CompanySocialMetadata.count', -1) do
      delete :destroy, id: @company_social_metadatum
    end

    assert_redirected_to company_social_metadata_index_path
  end
end
