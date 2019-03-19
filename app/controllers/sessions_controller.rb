class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        session[:username] = params[:username]
        redirect_to '/courses'
    end

    def destroy
        session.delete :username
        redirect_to '/login'
    end

end