class PostsController < ApplicationController
    before_action :authenticate_user!
    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(posts_params)
        if @post.save
            redirect_to root_path
        else
            render 'posts/new'
        end
    end

    private

    def posts_params
        params.require(:post).permit(:body)
    end
end
