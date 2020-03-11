class AddLongitudeAndLatitude < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :longitude, :string
    add_column :contacts, :latitude, :string
  end
end
