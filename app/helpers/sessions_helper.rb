module SessionsHelper

  def sign_in(user)
  	cookies.permanent.signed[:remember_token] = [user.id, user.salt]
  	current_user = user
  end

  # thisis a settermethod 
  def current_user=(user) 
  	@current_user = user
  end

  # this is a getter method
  def current_user
  	@current_user ||= user_from_remember_token
  	# ||= is an optimization because it will not hit the database .  	
  end

  def signed_in?
  	!current_user.nil?
  end

  private
     def user_from_remember_token
     	User.authenticate_with_salt(*remember_token)
     	#note, added star * before remember_token because it is has only one argument passed,
     	# the star is unwrapping the [user.id, user.salt] to make it 2 arguments
     end	

     def remember_token
     	cookies.signed[:remember_token] || [nil,nil]
     end

end

