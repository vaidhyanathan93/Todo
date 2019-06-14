class TaskSerializer < ActiveModel::Serializer
  attributes :id, :todo, :is_completed, :date
end
