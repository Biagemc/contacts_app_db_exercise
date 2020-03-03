class Api::ContactsController < ApplicationController
  def wife
    @wife_contact = Contact.second
    render "wife.json.jb"
  end

  def all_contacts
    contacts = Contact.all
    @hash_contacts = []

    contacts.each do |contact|
      @hash_contacts << {
        first_name: contact.first_name,
        last_name: contact.last_name,
        email: contact.email,
        phone_number: contact.phone_number,
      }
    end

    render "contacts.json.jb"
  end
end
