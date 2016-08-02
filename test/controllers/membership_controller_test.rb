require 'test_helper'

class MembershipControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get membership_index_url
    assert_response :success
  end

end
