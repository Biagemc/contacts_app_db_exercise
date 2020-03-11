class Contact < ApplicationRecord
  def friendly_updated_at
    updated_at.strftime("%d/%m/%Y")
  end

  def full_name
    return "#{first_name} #{middle_name} #{last_name}"
  end

  def japan_country_code
    "+81 #{phone_number}"
  end
end
