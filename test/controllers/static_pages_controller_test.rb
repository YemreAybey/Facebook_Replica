require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_path
    assert_redirected_to new_user_session_path
  end

  test "user should log in" do
    get new_user_registration_path
    assert_response :success
  end

end
