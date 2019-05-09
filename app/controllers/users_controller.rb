class UsersController < ApplicationController
    skip_before_action :authenticated, only: [:new, :create]
    def show

        if logged_in? 
            @user = User.find(session[:user_id])
        else
            redirect_to login_path
        end
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
        if @user.valid?
            @user.save
            redirect_to @user
        else
            redirect_to new_user_path
        end
    end


    private
    def user_params
        params.require(:user).permit(:username, :password) #:password_confirmation
    end

end
