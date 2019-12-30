require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get portfolio" do
    get user_portfolio_url
    assert_response :success
  end

end
