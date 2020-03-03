class Api::ContactsController < ApplicationController
  def wife
    @wife_contact = Contact.second
    render "wife.json.jb"
  end

  def all_contacts
    render "contacts.json.jb"
  end
end
