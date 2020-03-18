require 'test_helper'

class StocksControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get stocks_destroy_url
    assert_response :success
  end

end
