require 'test_helper'

class UseresControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get useres_home_url
    assert_response :success
  end

  test "should get lohin" do
    get useres_lohin_url
    assert_response :success
  end

end
