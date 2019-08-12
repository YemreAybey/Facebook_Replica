# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:Emre)
    @other_user = users(:Grace)
  end

  test 'should redirect when not logged in' do
    get home_path
    assert_redirected_to new_user_session_path
  end

  test 'should redirect to login when not logged in' do
    get user_path(@user)
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end

  test 'redirects when logged in as other user' do
    get user_session_path
    assert_equal 200, status
    post user_session_path, params: { user: {
      email: @other_user.email,
      password: 'password'
    } }
    follow_redirect!
    assert_equal 200, status
    get user_path(@user)
    assert_redirected_to home_path
  end
end
