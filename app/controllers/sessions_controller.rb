class SessionsController < ApplicationController
   
    def new
        @user = User.new
    end

    def create
    	auth_hash = request.env['omniauth.auth']
    	if auth_hash
      		@user = User.find_or_create_by(uid: auth_hash['uid']) do |u|
        	u.username= auth_hash['info']['name']
            u.email= auth_hash['info']['email']
            u.password= SecureRandom.hex
            end
        	login
        elsif
  			@user = User.find_by(username: params[:user][:username])
  			if @user && @user.authenticate(params[:user][:password])
  				login
  			else
  				#flash[:alert] = "Please make sure you have logged in correctly. If you do not have a login, please create a new account."
  				render 'new'
              end
        else
            @user = User.new
            render 'new'
  		end
    end

    def destroy
        session.clear
        redirect_to '/login'
    end

    private

    def login
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end
end