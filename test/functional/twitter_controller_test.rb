require 'test_helper'

class TwitterControllerTest < ActionController::TestCase
  test "should get add_credentials" do
    get :add_credentials
    assert_response :success
  end

  test "should get send_tweet" do
    get :send_tweet
    assert_response :success
  end

end
