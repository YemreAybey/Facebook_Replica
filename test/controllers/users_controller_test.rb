require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest 
  def setup
    @user = users(:Emre)
    @other_user = users(:Grace)
  end

  test "should redirect when not logged in" do
    get home_path
    assert_redirected_to new_user_session_path
  end

  test "should redirect edit when not logged in" do
    get user_path(@user)
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end 

end
