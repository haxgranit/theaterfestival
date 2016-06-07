require 'test_helper'

class PressItemsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @press_item = press_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:press_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create press_item" do
    assert_difference('PressItem.count') do
      post :create, press_item: { author: @press_item.author, date: @press_item.date, link: @press_item.link, production_id: @press_item.production_id, publication: @press_item.publication, quote: @press_item.quote }
    end

    assert_redirected_to press_item_path(assigns(:press_item))
  end

  test "should show press_item" do
    get :show, id: @press_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @press_item
    assert_response :success
  end

  test "should update press_item" do
    patch :update, id: @press_item, press_item: { author: @press_item.author, date: @press_item.date, link: @press_item.link, production_id: @press_item.production_id, publication: @press_item.publication, quote: @press_item.quote }
    assert_redirected_to press_item_path(assigns(:press_item))
  end

  test "should destroy press_item" do
    assert_difference('PressItem.count', -1) do
      delete :destroy, id: @press_item
    end

    assert_redirected_to press_items_path
  end
end
