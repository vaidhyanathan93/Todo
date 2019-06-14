class TaskSerializer < ActiveModel::Serializer
  attributes :id, :todo, :status, :date, :is_completed

  def is_completed
    object.status.eql?(STATUS[:closed])
  end
end
