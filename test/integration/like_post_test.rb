# frozen_string_literal: true

require 'test_helper'

class LikePostTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:Emre)
    @post = posts(:one)
    @like = likes(:one)
  end

  test 'user can like a post when logged in' do
    get user_session_path
    assert_equal 200, status
    post user_session_path, params: { user: {
      email: @user.email,
      password: 'password'
    } }
    follow_redirect!
    assert_equal 200, status
    get posts_path
    assert_difference '@post.likes.count', 1 do
      post likes_path, params: { like: { post_id: @post.id, user_id: @user.id } }
    end
    assert_redirected_to posts_path
  end

  test 'user can unlike a post' do
    get user_session_path
    assert_equal 200, status
    post user_session_path, params: { user: {
      email: @user.email,
      password: 'password'
    } }
    follow_redirect!
    assert_equal 200, status
    get posts_path
    assert_difference '@post.likes.count', 1 do
      post likes_path, params: { like: { post_id: @post.id, user_id: @user.id } }
    end
    assert_redirected_to posts_path
    follow_redirect!
    like = Like.last
    delete like_path(like.id)
    follow_redirect!
    assert_select 'input[value=?]', 'Like'
  end
end
