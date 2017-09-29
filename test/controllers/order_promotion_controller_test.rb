require 'test_helper'

class OrderPromotionControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get order_promotion_create_url
    assert_response :success
  end

end
