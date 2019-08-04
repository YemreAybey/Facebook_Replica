class PostsController < ApplicationController
    before_action :authenticate_user!
    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(posts_params)
        if @post.save
            redirect_to authenticated_root_path
        else
            render 'posts/new'
        end
    end

    def show
        @post = Post.find(params[:id])
        @comment = Comment.new
    end

    def index
      @posts = Post.all #This is for now
      @comment = Comment.new
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
end
