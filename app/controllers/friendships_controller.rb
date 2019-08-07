class FriendshipsController < ApplicationController

    def index
        @requests = current_user.pending_friends
    end
    def create
      @friendship = Friendship.new(friendship_params)
      if @friendship.save
        flash[:success] = "Friend Request Sent"
        redirect_to posts_path 
      end
    end

    def destroy
      @friendship = Friendship.find(params[:id])
        if f = Friendship.where(user_id:@friendship.friend_id).find_by(friend_id:@friendship.user_id)
          @friendship.destroy
          f.destroy
          flash[:success] = "Friendship Deleted"
          redirect_to friendships_path
        else
          @friendship.destroy
          flash[:success] = "Friendship Rejected"
          redirect_to friendships_path
        end
    end

    def update
        @friendship = Friendship.find(params[:id])
        Friendship.create!(user_id: @friendship.friend_id, friend_id: @friendship.user_id, status:true)
        @friendship.update_attribute(:status,  true)
        flash[:success] = "You Have Accepted the Request"
        redirect_to friendships_path
    end
    private
    def friendship_params
        params.require(:friendship).permit(:user_id, :friend_id, :status)
    end
end
