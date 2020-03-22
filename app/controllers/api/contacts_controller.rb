class Api::ContactsController < ApplicationController
  def index
    if current_user
      group = Group.find_by(name: params[:category_name])
      group_people = group.contacts
      @contacts = group_people.where(user_id: current_user.id)
    else
      @contacts = Contact.all
    end
    render "index.json.jb"
  end

  def create
    results = Geocoder.search(:address)
    longitude = results.first.coordinates[1]
    latitude = results.first.coordinates[0]

    @contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      bio: params[:bio],
      address: params[:address],
      latitude: latitude,
      longitude: longitude,
      user_id: current_user.id,
    )
    if @contact.save
      render "show.json.jb"
    else
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find(params[:id])
    render "show.json.jb"
  end

  def update
    results = Geocoder.search(:address)
    longitude = results.first.coordinates[1]
    latitude = results.first.coordinates[0]

    @contact = Contact.find(params[:id])

    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.bio = params[:bio] || @contact.bio
    @contact.address = params[:address] || @contact.address
    @contact.longitude = longitude
    @contact.latitude = latitude

    if @contact.save
      render "show.json.jb"
    else
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    render json: { message: "Contact id# #{params[:id]} was successfully destroyed" }
  end
end
