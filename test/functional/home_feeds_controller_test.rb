require 'test_helper'

class HomeFeedsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
