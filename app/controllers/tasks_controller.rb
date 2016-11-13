class TasksController < ApplicationController
  before_action :find_task, only: [:update, :destroy, :update_title]
  def index
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    render(:new) unless @task.save
  end

  def update
    @task.update!(done: params[:done].present?)
  end

  def update_title
    @task.update(task_params)
    head :ok, content_type: 'text/html'
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def task_params
    params.require(:task).permit(:title)
  end

  def tasks
    @tasks ||= Task.filtered(params[:type]).order(id: :desc)
  end

  def find_task
    @task = Task.find(params[:id])
  end

  helper_method :tasks
end
