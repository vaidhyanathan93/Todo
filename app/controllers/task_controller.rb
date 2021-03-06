class TaskController < ApplicationController
  before_action :load_task, only: %i[update destroy show complete incomplete]

  def index
    result = params[:status].nil? ? Task.all : Task.all.where(status: params[:status])
    respond_to do |format|
      format.json do
        render json: result, each_serializer: TaskSerializer
      end
    end
  end

  def show
    render_response
  end

  def create
    @task  = Task.new(task_params)
    save_task
    render_response
  end

  def update
    @task.attributes = task_params
    save_task
    render_response
  end

  def complete
    @task.status = STATUS[:closed]
    save_task
    render_response
  end

  def incomplete
    @task.status = STATUS[:open]
    save_task
    render_response
  end


  def destroy
    @task.destroy!
    render_response
  end

  private

  def load_task
    @task = Task.find_by_id(params[:id])
    render_not_found if @task.nil?
  end

  def render_not_found
    render json: { message: "Resource not found" }, status: 404
  end

  private

  def render_response
    respond_to do |format|
      format.json do
        render json: @task, serializer: TaskSerializer
      end
    end
  end

  def save_task
    @task.save!
  end

  def task_params
    params.require(:task).permit(:todo, :status, :date)
  end

end
