class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id
    if @comment.save
    flash[:notice] = 'Comment was successfully created.'
    redirect_to @comment.post
    else
    flash[:notice] = "Error creating comment: #{@comment.errors}"
     
    end
  end

  def edit
  end

  private 

  def comment_params
    params.require(:comment).permit(:body)
  end
  
end
