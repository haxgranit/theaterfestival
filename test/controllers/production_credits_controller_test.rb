require 'test_helper'

class ProductionCreditsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @production_credit = production_credits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:production_credits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create production_credit" do
    assert_difference('ProductionCredit.count') do
      post :create, production_credit: { artist_id: @production_credit.artist_id, confirmed: @production_credit.confirmed, end_date: @production_credit.end_date, name: @production_credit.name, position: @production_credit.position, production_id: @production_credit.production_id, start_date: @production_credit.start_date, type: @production_credit.type }
    end

    assert_redirected_to production_credit_path(assigns(:production_credit))
  end

  test "should show production_credit" do
    get :show, id: @production_credit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @production_credit
    assert_response :success
  end

  test "should update production_credit" do
    patch :update, id: @production_credit, production_credit: { artist_id: @production_credit.artist_id, confirmed: @production_credit.confirmed, end_date: @production_credit.end_date, name: @production_credit.name, position: @production_credit.position, production_id: @production_credit.production_id, start_date: @production_credit.start_date, type: @production_credit.type }
    assert_redirected_to production_credit_path(assigns(:production_credit))
  end

  test "should destroy production_credit" do
    assert_difference('ProductionCredit.count', -1) do
      delete :destroy, id: @production_credit
    end

    assert_redirected_to production_credits_path
  end
end
