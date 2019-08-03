class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
    flash[:success] = "Comment was successfully created."
    redirect_to @comment.post
    else
    flash.now[:danger] = "Error creating comment"
    end
  end

  def edit
  end

  private 

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
  
end
