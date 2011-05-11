require 'test_helper'

class FriendsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get send_invite" do
    get :send_invite
    assert_response :success
  end

end
