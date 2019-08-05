class UsersController < ApplicationController
    before_action :authorize_user!
    def show
        @user = current_user
    end

    def authorize_user! 
        @user = User.find(params[:id])
        unless current_user == @user
            flash[:danger] = "You are not authorized for this!"
            redirect_to home_path 
        end
    end
end
