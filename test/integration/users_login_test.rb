require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:Emre)
  end
  test "redicts when logged in as other user" do
    get user_session_path
    assert_equal 200, status
    post user_session_path, params: {user: {
      email:    @user.email,
      password: "password"
    }}
    follow_redirect!
    assert_equal 200, status
    assert_select 'div.alert', 'Signed in successfully.'
  end
end
