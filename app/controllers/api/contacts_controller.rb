class Api::ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render "index.json.jb"
  end

  def create
    results = Geocoder.search(:address)
    longitude = results.first.coordinates[1]
    latitude = results.first.coordinates[0]

    @contact = Contact.create(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      bio: params[:bio],
      address: params[:address],
      latitude: latitude,
      longitude: longitude,
    )
    # @contact.save
    render "show.json.jb"
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    results = Geocoder.search(:address)
    longitude = results.first.coordinates[1]
    latitude = results.first.coordinates[0]

    @contact = Contact.find_by(id: params[:id])
    @contact.update(
      first_name: params[:first_name] || @contact.first_name,
      middle_name: params[:middle_name] || @contact.middle_name,
      last_name: params[:last_name] || @contact.last_name,
      email: params[:email] || @contact.email,
      phone_number: params[:phone_number] || @contact.phone_number,
      bio: params[:bio] || @contact.bio,
      address: params[:address] || @contact.address,
      longitude: longitude,
      latitude: latitude,
    )
    @contact.save
    render "show.json.jb"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render json: { message: "Contact id# #{params[:id]} was successfully destroyed" }
  end
end
