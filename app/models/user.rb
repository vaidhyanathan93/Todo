class User < ApplicationRecord
  include BCrypt
  validates :email, presence: true, uniqueness: true
  validate :password_validator

  def password_validator
    self.errors.add :base, "Password should be reverse of email" unless password.eql?(email.reverse)
  end

  def password
    @password ||= Password.new(password_digest)
  end
end
