class TasksController < ApplicationController
  def create
  	#@user = User.find(params[:user_id])
    @task = Task.new(params.require(:task).permit(:description, :user_id))
    if @task.save
    	redirect_to request.referer
    else
      flash[:error] = "Either you already finished, or there was an error, please try again."
    end
  end

def destroy

  @task = tasks.find(params[:id])
  if @task.destroy
  	flash[:success] = "Task completed!"
  else
  	flash[:error] = "Something broke"
  end
end

end
