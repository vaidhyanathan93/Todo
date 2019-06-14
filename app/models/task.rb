class Task < ApplicationRecord
  validates :todo, :creator_id, presence: true

end
