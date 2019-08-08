require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user1 = users(:Emre)
    @user2 = users(:Grace)
    @friendship = friendships(:one)
  end

  test "Sends the request" do
    get user_session_path
    post user_session_path, params: {user: {
      email:    "mugoiri@example.com",
      password: "password"
    }}
    follow_redirect!
    get friendships_path
    assert_select 'input[value=?]', 'Accept'
    assert_select 'input[value=?]', 'Reject'
  end

  test "User can accept request" do
    get user_session_path
    post user_session_path, params: {user: {
      email:    "mugoiri@example.com",
      password: "password"
    }}
    follow_redirect!
    get friendships_path
    assert_difference 'Friendship.all.count', 1 do
      patch friendship_path(@friendship.id), params: {friendship: {status:true}}
    end
  end
  test "User can reject request" do
    get user_session_path
    post user_session_path, params: {user: {
      email:    "mugoiri@example.com",
      password: "password"
    }}
    follow_redirect!
    get friendships_path
    assert_difference 'Friendship.all.count', -1 do
      delete friendship_path(@friendship.id)
    end
  end
end
