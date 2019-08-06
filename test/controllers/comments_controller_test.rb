require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:Emre)
    @comment = comments(:one)
  end
  test "user can post a comment when logged in" do
    get user_session_path
    assert_equal 200, status
    post user_session_path, params: {user: {
      email:    @user.email,
      password: "password"
    }}
    follow_redirect!
    assert_equal 200, status
    get posts_path
    assert_difference 'Comment.count', 1 do
    post comments_path, params: { comment: { body: "Lorem ipsum", post_id: @comment.post.id, user_id: @user.id } }
    end
    assert_redirected_to posts_path
  end

end
