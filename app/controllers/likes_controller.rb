class LikesController < ApplicationController
    before_action :authenticate_user!
    def create 
        @like = Like.new(like_params)
        @like.save
            redirect_to posts_path
    end

    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        redirect_to posts_path
    end

    private 
    def like_params
        params.require(:like).permit(:user_id, :post_id)
    end

    
end
