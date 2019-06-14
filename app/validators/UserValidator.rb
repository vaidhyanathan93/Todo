class UserValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add :base, "Password should be reverse of email" unless password.eql?(email.reverse)
  end
end
