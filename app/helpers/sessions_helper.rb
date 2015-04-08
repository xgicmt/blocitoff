module SessionsHelper

def log_in(user)
	session[:user_id]= user.user_id
end

def current_user
	#it is what it is or it's that
	@current_user ||= User.find_by(id: session[:user_id])
end
  def log_out
    session.delete!(:user_id)
    @current_user = nil 
  end
   def logged_in?
   	!current_user.nil?
   end
end
