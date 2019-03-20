class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    helper_method :current_user, :logged_in?, :login_required


    def login_required
        if !logged_in?
          redirect_to login_path, :notice => "Please login first!"
        end
    end

	    def current_user
            @current_user ||= User.find(session[:user_id]) if session[:user_id]
            #@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]	
        end

        def logged_in?
            !!current_user
        end

end
