class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
    flash[:success] = "Comment was successfully created."
    redirect_to posts_path
    else
    flash.now[:danger] = "Error creating comment"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
   end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    flash[:success] = "Comment Updated!"
    redirect_to posts_path
  end

def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment Destroyed!"
    redirect_to posts_path
end

  private 

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
  
end
