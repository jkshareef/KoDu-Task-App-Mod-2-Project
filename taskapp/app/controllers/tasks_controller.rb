class TasksController < ApplicationController

  def index
    if logged_in?
      @month = nil
      if params[:month] == nil
        @month = Date::MONTHNAMES[Time.now.month]
      else
        @month = params[:month]
      end
      @tasks = current_user.tasks.select {|task| task.month_name == @month}
    else
      redirect_to login_path
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
    target_date = params[:target_date]
    target_date = target_date.split('-')
    if target_date[1].to_i < 10
      target_date[1] = "0#{target_date[1]}"
    end
    if target_date[2].to_i < 10
      target_date[2] = "0#{target_date[2]}"
    end
    @task.date = target_date.join('-')
  end

  def create

    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      redirect_to @task
    else
      flash[:errors] = @task.errors.full_messages
      flash[:task_attributes] = @task.attributes

      @error_message = flash[:errors].join('---')

      render :new
    end

  end

  def edit
    @task = Task.find(params[:id])
  end

  def update

    @task = Task.find(params[:id])
    if @task.update(task_params)
      @task.user = current_user
      redirect_to @task
    else
      flash[:errors] = @task.errors.full_messages
      flash[:task_attributes] = @task.attributes

      @error_message = flash[:errors].join('---')
      render :edit
    end

  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path

  end


  private

  def task_params
    params.require(:task).permit(:user_id, :description, :date, :start_time, :end_time, :urgent)
  end
end
