class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email: true

  def friendly_updated_at
    updated_at.strftime("%d/%m/%Y")
  end

  def full_name
    return "#{first_name} #{middle_name} #{last_name}"
  end

  def japan_country_code
    "+81 #{phone_number}"
  end

  # def address
  #   [street, city, state, country].compact.join(", ")
  # end
end
