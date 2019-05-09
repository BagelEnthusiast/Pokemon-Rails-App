class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticated
  
    def current_user
      if session[:user_id]
        @user = User.find(session[:user_id])
      else
        #nil
      end
    end
  
    def logged_in?
      # if current_user
      #   true
      # else
      #   false
      # end
  
      !!current_user
    end
  
    def authenticated
      redirect_to login_path unless logged_in?
    end


end
