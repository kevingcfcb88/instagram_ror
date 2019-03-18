class UsersController < ApplicationController

    def show
        @posts = current_user.posts.order(created_at: :desc).page(params[:page]).per(5)
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        current_user.update(user_params)
        redirect_to current_user
    end

    private 
    
    def user_params
        params.require(:user).permit(:username, :name, :website, :bio, :email, :phone, :gender)
    end

end
