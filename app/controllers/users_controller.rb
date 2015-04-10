class UsersController < ApplicationController

	def index

	end

  	def new
      @user = User.new
  	end


  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Welcome to blocitoff"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
    @tasks = Task.new
    @user = User.find(params[:id])
   # @current_user = @user
    @task = @user.tasks
    if current_user != @user
      redirect_to current_user, alert: "Stop poking around in my URL"
    end
    #@task = @current_user.tasks
  end


  def destroy

  end

################################ GOING PRIVATE ##########################################
  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end
