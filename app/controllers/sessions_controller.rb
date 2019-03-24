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
        else
  			@user = User.find_by(name: params[:user][:name])
  			if @user && @user.authenticate(params[:user][:password])
  				login
  			else
  				flash[:alert] = "Please make sure you have logged in correctly. If you do not have a login, please create a new account."
  				redirect_to signup_path
  			end
  		end
    end
      #  @user = User.find_by(username: params[:user][:username])
      #  if @user && @user.authenticate(params[:user][:password])
      #      session[:user_id] = @user.id
      #      redirect_to user_path(@user)
      #  else
      #      flash[:message] = "Your username or password was incorrect."
      #      redirect_to signup_path
      #  end
    

  #  def create_from_github
      #  @user = User.new do |u|
      #      u.uid = auth['uid']
      #      u.username = auth['info']['username']
      #      u.email = auth['info']['email']
      #    end
       
      #    session[:user_id] = @user.id
          
      #    redirect_to user_path(@user)
      #  end

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