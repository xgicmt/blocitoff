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
  		redirect_to root_path, :notice => "Signed Up"
  	else
  		redirect_to root_path, :notice => "Failed"
  	end
  end

  def show

  end


  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
#    params.require(:user).permit(:email, :password_hash, :password_salt)
  end

end
