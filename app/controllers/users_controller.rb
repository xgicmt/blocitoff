class UsersController < ApplicationController
  	#attr_accessor :email, :password, :password_confirmation
	def index

	end

  	def new
      @user = User.new
  	end


  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to "#sign_up", :notice => "Signed Up"
  	else
  		redirect_to root_url, :notice => "Failed"
  	end
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
#    params.require(:user).permit(:email, :password_hash, :password_salt)
  end

end