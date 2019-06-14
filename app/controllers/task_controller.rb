class TaskController < ApplicationController

  def index
    result = Task.all

    respond_to do |format|
      format.json do
        render json: result, each_serializer: TaskSerializer
      end
    end
  end
end
