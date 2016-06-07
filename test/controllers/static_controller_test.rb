require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  def setup
    @base_title = "TheaterEngine"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select 'title', "#{@base_title} | Home"
  end

end
