class Task < ApplicationRecord

  before_validation :set_creator

  validates :todo, :creator_id, presence: true

  def set_creator
    self.creator_id = '1'
   end
end
