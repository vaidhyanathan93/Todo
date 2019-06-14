class User < ApplicationRecord
  include BCrypt
  validates :email, presence: true, uniqueness: true
  validate :password_validator

  def password_validator
    self.errors.add :base, "Password should be reverse of email" unless password == email.reverse
  end

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end

