class TaskController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :load_task, only: %i[update destroy show complete incomplete]
  before_action :authenticate

  def index
    result = Task.all
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
    @task.is_completed = true
    save_task
    render_response
  end

  def incomplete
    @task.is_completed = false
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

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      # you probably want to guard against a wrong username, and encrypt the
      # password but this is the idea.
      @user = User.find_by_email(username)
      Thread.current[:user] = @user
          @user.password == password
    end
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
    params.require(:task).permit(:todo, :is_completed, :date)
  end

end
