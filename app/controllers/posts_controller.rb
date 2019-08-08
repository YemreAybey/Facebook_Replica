class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_user!, only: [:edit, :update, :destroy]

    def create
        @post = current_user.posts.build(posts_params)
        if @post.save
            redirect_to posts_path
        else
            flash[:danger] = "Post cannot be blank"
            redirect_to posts_path
        end
    end

    def show
        @post = Post.find(params[:id])
        @comment = Comment.new
    end

    def index
      @posts = current_user.timeline_posts
      @comment = Comment.new
      @like = Like.new
      @post = Post.new
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(posts_params)
        flash[:success] = "Post Updated!"
        redirect_to posts_path
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:success] = "Post Destroyed!"
        redirect_to posts_path
    end

  
    private

    def posts_params
        params.require(:post).permit(:body)
    end

    def authorize_user!
        @post = current_user.posts.find_by(id: params[:id])
        if @post.nil?
          flash[:danger]= "You Are Not Authorized For This"
          redirect_to posts_path
        end 
    end
end
