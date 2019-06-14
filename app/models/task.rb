class Task < ApplicationRecord

  before_validation :set_creator

  validates :todo, :creator_id, presence: true

  default_scope lambda {
    where('creator_id= ?', Thread.current[:user].id)
  }

  def set_creator
    self.creator_id = Thread.current[:user].id
   end
end
