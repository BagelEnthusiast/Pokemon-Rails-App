class SessionsController < ApplicationController

    skip_before_action :authenticated, only: [:new, :create]

    def new
    
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to @user
        else
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        # session[:user_id] = nil
    end
end