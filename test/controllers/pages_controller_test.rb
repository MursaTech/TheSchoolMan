require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get settings" do
    get :settings
    assert_response :success
  end

  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

end
