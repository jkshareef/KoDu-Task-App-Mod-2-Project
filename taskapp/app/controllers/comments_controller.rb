class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
    #@task = Task.find(params[:task_id])
    #@comment.task = @task
  #  @comment.user = current_user
    redirect_to @comment.task
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :task_id)
  end
end
