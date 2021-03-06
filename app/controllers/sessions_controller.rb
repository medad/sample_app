class SessionsController < ApplicationController
  def new
  	@title = "Sign in"
  end

  def create
  # NOte; this is the hash generated.
	# session:
	#   email: sample user
	#   password: user1@sample.com

  	 user = User.authenticate(params[:session][:email], 
  	 					      params[:session][:password])

  	 if user.nil?
  	   flash.now[:error]  = "Invalid email/password combination."
  	   @title = "Sign in"
  	   render 'new'
  	 else
        #handle succesful sigin.  
        sign_in user
        redirect_to user_path(user)  	   
  	 end
  	
  end

  def destroy
  	sign_out
    redirect_to root_path
  end   
end
