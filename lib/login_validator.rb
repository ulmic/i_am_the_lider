class LoginValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A[a-zA-Z0-9]+\Z/
      record.errors.add(attribute, :login, options.merge(value: value))
    end
  end
end
