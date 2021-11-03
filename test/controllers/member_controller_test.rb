require "test_helper"

class MemberControllerTest < ActionDispatch::IntegrationTest
  test "should get ManageMembers" do
    get member_ManageMembers_url
    assert_response :success
  end
end
