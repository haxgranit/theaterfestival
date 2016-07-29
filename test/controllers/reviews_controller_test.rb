require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  setup do
    @review = reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post :create, review: { agree: @review.agree, date: @review.date, disagree: @review.disagree, full_text: @review.full_text, production_id: @review.production_id, rating: @review.rating, summary: @review.summary, title: @review.title }
    end

    assert_redirected_to review_path(assigns(:review))
  end

  test "should show review" do
    get :show, id: @review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @review
    assert_response :success
  end

  test "should update review" do
    patch :update, id: @review, review: { agree: @review.agree, date: @review.date, disagree: @review.disagree, full_text: @review.full_text, production_id: @review.production_id, rating: @review.rating, summary: @review.summary, title: @review.title }
    assert_redirected_to review_path(assigns(:review))
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete :destroy, id: @review
    end

    assert_redirected_to reviews_path
  end
end
