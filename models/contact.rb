class Contact < ActiveRecord::Base

  def name
    [first_name, last_name].join(' ')
  end

  def self.create_contact(first_name, last_name, phone_number)
    new_contact = {first_name: first_name, last_name: last_name, phone_number: phone_number}
    Contact.create(new_contact)
  end
end
